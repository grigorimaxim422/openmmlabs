#ifndef OPENMM_CUDA_TENSORRT_KERNEL_FACTORY_H_
#define OPENMM_CUDA_TENSORRT_KERNEL_FACTORY_H_

#include "openmm/KernelFactory.h"

namespace OpenMM {

/**
 * This KernelFactory creates kernels for the CUDA implementation of TensorRT plugin
 */

class CudaTensorRTKernelFactory : public KernelFactory {
public:
    KernelImpl* createKernelImpl(std::string name, const Platform& platform, ContextImpl& context) const;
};

} // namespace OpenMM

#endif /*OPENMM_CUDA_TENSORRT_KERNEL_FACTORY_H_*/
