
C
	positionsPlaceholder*
dtype0*
shape:���������
;

boxvectorsPlaceholder*
dtype0*
shape
:
)
DiagPartDiagPart
boxvectors*
T0
0
truedivRealDiv	positionsDiagPart*
T0
 
FloorFloortruediv*
T0
$
mulMulFloorDiagPart*
T0
#
subSub	positionsmul*
T0
2
pow/yConst*
dtype0*
valueB
 *   @

powPowsubpow/y*
T0
:
ConstConst*
valueB"       *
dtype0
?
energySumpowConst*

Tidx0*
	keep_dims( *
T0

NegNegenergy*
T0
8
gradients/ShapeConst*
valueB *
dtype0
@
gradients/grad_ys_0Const*
valueB
 *  �?*
dtype0
W
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*

index_type0
6
gradients/Neg_grad/NegNeggradients/Fill*
T0
X
#gradients/energy_grad/Reshape/shapeConst*
valueB"      *
dtype0
|
gradients/energy_grad/ReshapeReshapegradients/Neg_grad/Neg#gradients/energy_grad/Reshape/shape*
T0*
Tshape0
B
gradients/energy_grad/ShapeShapepow*
T0*
out_type0
y
gradients/energy_grad/TileTilegradients/energy_grad/Reshapegradients/energy_grad/Shape*

Tmultiples0*
T0
?
gradients/pow_grad/ShapeShapesub*
out_type0*
T0
C
gradients/pow_grad/Shape_1Const*
valueB *
dtype0
�
(gradients/pow_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/pow_grad/Shapegradients/pow_grad/Shape_1*
T0
I
gradients/pow_grad/mulMulgradients/energy_grad/Tilepow/y*
T0
E
gradients/pow_grad/sub/yConst*
valueB
 *  �?*
dtype0
G
gradients/pow_grad/subSubpow/ygradients/pow_grad/sub/y*
T0
C
gradients/pow_grad/PowPowsubgradients/pow_grad/sub*
T0
X
gradients/pow_grad/mul_1Mulgradients/pow_grad/mulgradients/pow_grad/Pow*
T0
�
gradients/pow_grad/SumSumgradients/pow_grad/mul_1(gradients/pow_grad/BroadcastGradientArgs*
T0*

Tidx0*
	keep_dims( 
n
gradients/pow_grad/ReshapeReshapegradients/pow_grad/Sumgradients/pow_grad/Shape*
Tshape0*
T0
I
gradients/pow_grad/Greater/yConst*
valueB
 *    *
dtype0
Q
gradients/pow_grad/GreaterGreatersubgradients/pow_grad/Greater/y*
T0
+
gradients/pow_grad/LogLogsub*
T0
8
gradients/pow_grad/zeros_like	ZerosLikesub*
T0

gradients/pow_grad/SelectSelectgradients/pow_grad/Greatergradients/pow_grad/Loggradients/pow_grad/zeros_like*
T0
I
gradients/pow_grad/mul_2Mulgradients/energy_grad/Tilepow*
T0
]
gradients/pow_grad/mul_3Mulgradients/pow_grad/mul_2gradients/pow_grad/Select*
T0
�
gradients/pow_grad/Sum_1Sumgradients/pow_grad/mul_3*gradients/pow_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
t
gradients/pow_grad/Reshape_1Reshapegradients/pow_grad/Sum_1gradients/pow_grad/Shape_1*
Tshape0*
T0
E
gradients/sub_grad/ShapeShape	positions*
T0*
out_type0
A
gradients/sub_grad/Shape_1Shapemul*
T0*
out_type0
�
(gradients/sub_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/sub_grad/Shapegradients/sub_grad/Shape_1*
T0
�
gradients/sub_grad/SumSumgradients/pow_grad/Reshape(gradients/sub_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
n
gradients/sub_grad/ReshapeReshapegradients/sub_grad/Sumgradients/sub_grad/Shape*
T0*
Tshape0
�
gradients/sub_grad/Sum_1Sumgradients/pow_grad/Reshape*gradients/sub_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
@
gradients/sub_grad/NegNeggradients/sub_grad/Sum_1*
T0
r
gradients/sub_grad/Reshape_1Reshapegradients/sub_grad/Neggradients/sub_grad/Shape_1*
T0*
Tshape0
A
gradients/mul_grad/ShapeShapeFloor*
T0*
out_type0
H
gradients/mul_grad/Shape_1Const*
valueB:*
dtype0
�
(gradients/mul_grad/BroadcastGradientArgsBroadcastGradientArgsgradients/mul_grad/Shapegradients/mul_grad/Shape_1*
T0
N
gradients/mul_grad/MulMulgradients/sub_grad/Reshape_1DiagPart*
T0
�
gradients/mul_grad/SumSumgradients/mul_grad/Mul(gradients/mul_grad/BroadcastGradientArgs*

Tidx0*
	keep_dims( *
T0
n
gradients/mul_grad/ReshapeReshapegradients/mul_grad/Sumgradients/mul_grad/Shape*
Tshape0*
T0
M
gradients/mul_grad/Mul_1MulFloorgradients/sub_grad/Reshape_1*
T0
�
gradients/mul_grad/Sum_1Sumgradients/mul_grad/Mul_1*gradients/mul_grad/BroadcastGradientArgs:1*

Tidx0*
	keep_dims( *
T0
t
gradients/mul_grad/Reshape_1Reshapegradients/mul_grad/Sum_1gradients/mul_grad/Shape_1*
T0*
Tshape0
N
forces/inputPackgradients/sub_grad/Reshape*

axis *
N*
T0
)
forcesIdentityforces/input*
T0"