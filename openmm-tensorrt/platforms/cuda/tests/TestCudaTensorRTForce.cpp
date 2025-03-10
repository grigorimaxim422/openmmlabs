/**
 * This tests the CUDA implementation of TensorRTForce.
 */

#include "TensorRTForce.h"
#include "openmm/internal/AssertionUtilities.h"
#include "openmm/Context.h"
#include "openmm/Platform.h"
#include "openmm/System.h"
#include "openmm/VerletIntegrator.h"
#include "sfmt/SFMT.h"
#include <cmath>
#include <iostream>
#include <vector>

using namespace OpenMM;
using namespace std;

extern "C" OPENMM_EXPORT void registerTensorRTCudaKernelFactories();

void testForce() {
    // Create a random cloud of particles.
    
    const int numParticles = 10;
    System system;
    vector<Vec3> positions(numParticles);
    OpenMM_SFMT::SFMT sfmt;
    init_gen_rand(0, sfmt);
    for (int i = 0; i < numParticles; i++) {
        system.addParticle(1.0);
        positions[i] = Vec3(genrand_real2(sfmt), genrand_real2(sfmt), genrand_real2(sfmt))*10;
    }
    TensorRTForce* force = new TensorRTForce("graphs/aperiodic.trt");
    system.addForce(force);
    
    // Compute the forces and energy.

    VerletIntegrator integ(1.0);
    Platform& platform = Platform::getPlatformByName("CUDA");
    Context context(system, integ, platform);
    context.setPositions(positions);
    State state = context.getState(State::Energy | State::Forces);
    
    // See if the energy is correct.  The graph defines a potential of the form E(r) = |r|^2
    
    double expectedEnergy = 0;
    for (int i = 0; i < numParticles; i++) {
        Vec3 pos = positions[i];
        double r = sqrt(pos.dot(pos));
        expectedEnergy += r*r;
        ASSERT_EQUAL_VEC(pos*(-2.0), state.getForces()[i], 1e-5);
    }
    ASSERT_EQUAL_TOL(expectedEnergy, state.getPotentialEnergy(), 1e-5);
}

void testPeriodicForce() {
    // Create a random cloud of particles.

    const int numParticles = 10;
    System system;
    system.setDefaultPeriodicBoxVectors(Vec3(2, 0, 0), Vec3(0, 3, 0), Vec3(0, 0, 4));
    vector<Vec3> positions(numParticles);
    OpenMM_SFMT::SFMT sfmt;
    init_gen_rand(0, sfmt);
    for (int i = 0; i < numParticles; i++) {
        system.addParticle(1.0);
        positions[i] = Vec3(genrand_real2(sfmt), genrand_real2(sfmt), genrand_real2(sfmt))*10;
    }
    TensorRTForce* force = new TensorRTForce("graphs/periodic.trt");
    force->setUsesPeriodicBoundaryConditions(true);
    system.addForce(force);

    // Compute the forces and energy.

    VerletIntegrator integ(1.0);
    Platform& platform = Platform::getPlatformByName("CUDA");
    Context context(system, integ, platform);
    context.setPositions(positions);
    State state = context.getState(State::Energy | State::Forces);

    // See if the energy is correct.  The graph defines a potential of the form E(r) = |r|^2

    double expectedEnergy = 0;
    for (int i = 0; i < numParticles; i++) {
        Vec3 pos = positions[i];
        pos[0] -= floor(pos[0]/2.0)*2.0;
        pos[1] -= floor(pos[1]/3.0)*3.0;
        pos[2] -= floor(pos[2]/4.0)*4.0;
        double r = sqrt(pos.dot(pos));
        expectedEnergy += r*r;
        ASSERT_EQUAL_VEC(pos*(-2.0), state.getForces()[i], 1e-5);
    }
    ASSERT_EQUAL_TOL(expectedEnergy, state.getPotentialEnergy(), 1e-5);
}

int main(int argc, char* argv[]) {
    try {
        registerTensorRTCudaKernelFactories();
        if (argc > 1)
            Platform::getPlatformByName("CUDA").setPropertyDefaultValue("Precision", string(argv[1]));
        testForce();
        testPeriodicForce();
    }
    catch(const std::exception& e) {
        std::cout << "exception: " << e.what() << std::endl;
        return 1;
    }
    std::cout << "Done" << std::endl;
    return 0;
}
