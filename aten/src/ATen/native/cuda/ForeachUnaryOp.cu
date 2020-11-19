#include <ATen/Dispatch.h>
#include <ATen/native/ForeachUtils.h>
#include <ATen/native/cuda/ForeachFunctors.cuh>

namespace at { namespace native {

template <template<class> class Op>
std::vector<Tensor> floating_complex_half(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    std::vector<at::Tensor> vec_res;
    vec_res.reserve(tensors.size());
    for (const auto& t: tensors) {
        vec_res.emplace_back(at::native::empty_like(t));
    }

    tensor_lists.emplace_back(tensors.vec());
    tensor_lists.emplace_back(std::move(vec_res));

    AT_DISPATCH_FLOATING_AND_COMPLEX_TYPES_AND1(ScalarType::Half,  tensors[0].scalar_type(), "foreach_unary_op_cuda", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<2>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 2,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 1>(),
                              Op<opmath_t>());
    });
    return tensor_lists[1];
}

template <template<class> class Op>
void floating_complex_half_(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_FLOATING_AND_COMPLEX_TYPES_AND1(ScalarType::Half, tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 0>(),
                              Op<opmath_t>());
    });
}

template <template<class> class Op>
std::vector<Tensor> floating_complex_half_bfloat16(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    std::vector<at::Tensor> vec_res;
    vec_res.reserve(tensors.size());
    for (const auto& t: tensors) {
        vec_res.emplace_back(at::native::empty_like(t));
    }

    tensor_lists.emplace_back(tensors.vec());
    tensor_lists.emplace_back(std::move(vec_res));

    AT_DISPATCH_FLOATING_AND_COMPLEX_TYPES_AND2(ScalarType::Half, ScalarType::BFloat16, tensors[0].scalar_type(), "foreach_unary_op_cuda", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<2>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 2,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 1>(),
                              Op<opmath_t>());
    });
    return tensor_lists[1];
}

template <template<class> class Op>
void floating_complex_half_bfloat16_(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_FLOATING_AND_COMPLEX_TYPES_AND2(ScalarType::Half, ScalarType::BFloat16, tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 0>(),
                              Op<opmath_t>());
    });
}

template <template<class> class Op>
std::vector<Tensor> foreach_unary_op_all_complex_half_bfloat16(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    std::vector<at::Tensor> vec_res;
    vec_res.reserve(tensors.size());
    for (const auto& t: tensors) {
        vec_res.emplace_back(at::native::empty_like(t));
    }

    tensor_lists.emplace_back(tensors.vec());
    tensor_lists.emplace_back(std::move(vec_res));

    AT_DISPATCH_ALL_TYPES_AND_COMPLEX_AND2(ScalarType::Half, at::ScalarType::BFloat16, tensors[0].scalar_type(), "foreach_unary_op_cuda", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<2>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 2,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 1>(),
                              Op<opmath_t>());
    });
    return tensor_lists[1];
}

template <template<class> class Op>
void foreach_unary_op_all_complex_half_bfloat16_(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_ALL_TYPES_AND_COMPLEX_AND2(ScalarType::Half, at::ScalarType::BFloat16, tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 0>(),
                              Op<opmath_t>());
    });
}

template <template<class> class Op>
std::vector<Tensor> floating_half(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    std::vector<at::Tensor> vec_res;
    vec_res.reserve(tensors.size());
    for (const auto& t: tensors) {
        vec_res.emplace_back(at::native::empty_like(t));
    }

    tensor_lists.emplace_back(tensors.vec());
    tensor_lists.emplace_back(std::move(vec_res));

    AT_DISPATCH_FLOATING_TYPES_AND(ScalarType::Half,  tensors[0].scalar_type(), "foreach_unary_op_cuda", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<2>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 2,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 1>(),
                              Op<opmath_t>());
    });
    return tensor_lists[1];
}

template <template<class> class Op>
void floating_half_(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_FLOATING_TYPES_AND_HALF(tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 0>(),
                              Op<opmath_t>());
    });
}

template <template<class> class Op>
void foreach_op_unary_(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_FLOATING_TYPES_AND_HALF(tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 0>(),
                              Op<opmath_t>());
    });
}

template <template<class> class Op>
std::vector<Tensor> foreach_unary_op_bfloat16(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    std::vector<at::Tensor> vec_res;
    vec_res.reserve(tensors.size());
    for (const auto& t: tensors) {
        vec_res.emplace_back(at::native::empty_like(t));
    }

    tensor_lists.emplace_back(tensors.vec());
    tensor_lists.emplace_back(std::move(vec_res));

    AT_DISPATCH_FLOATING_TYPES_AND2(ScalarType::Half, ScalarType::BFloat16,  tensors[0].scalar_type(), "foreach_unary_op_cuda", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<2>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 2,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 1>(),
                              Op<opmath_t>());
    });
    return tensor_lists[1];
}

template <template<class> class Op>
void foreach_unary_op_bfloat16_(TensorList tensors) {
    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_FLOATING_TYPES_AND2(ScalarType::Half, ScalarType::BFloat16, tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 0>(),
                              Op<opmath_t>());
    });
}

#define FLOATING_complex_half(NAME, NAME1)                            \
template<typename T>                                                     \
struct NAME1 {                                                           \
    __device__ T operator()(T t) const { return std::NAME(t); }          \
};                                                                       \
                                                                         \
std::vector<Tensor> foreach_tensor_##NAME##_cuda(TensorList tensors) {   \
    check_foreach_api_restrictions(tensors);                             \
    bool has_integral = false;                                           \
    for (auto t : tensors) {                                             \
        if (at::isIntegralType(t.scalar_type(), /*includeBool=*/true)) { \
            has_integral = true;                                         \
        }                                                                \
    }                                                                    \
                                                                         \
    /* MTA doesnt support different return type than input one*/         \
    if (!can_use_fast_route(tensors) || has_integral) {                  \
        return at::native::foreach_tensor_##NAME##_slow(tensors);        \
    }                                                                    \
                                                                         \
    return floating_complex_half<NAME1>(tensors);                        \
}                                                                        \
                                                                         \
void foreach_tensor_##NAME##_cuda_(TensorList tensors) {                 \
    check_foreach_api_restrictions(tensors);                             \
    bool has_integral = false;                                           \
    for (auto t : tensors) {                                             \
        if (at::isIntegralType(t.scalar_type(), /*includeBool=*/true)) { \
            has_integral = true;                                         \
        }                                                                \
    }                                                                    \
                                                                         \
    /* MTA doesnt support different return type than input one*/         \
    if (!can_use_fast_route(tensors) || has_integral) {                  \
        return at::native::foreach_tensor_##NAME##_slow_(tensors);       \
    }                                                                    \
                                                                         \
    floating_complex_half_<NAME1>(tensors);                              \
}

#define FLOATING_complex_half_bfloat16(NAME, NAME1)                      \
template<typename T>                                                     \
struct NAME1 {                                                           \
    __device__ T operator()(T t) const { return std::NAME(t); }          \
};                                                                       \
                                                                         \
std::vector<Tensor> foreach_tensor_##NAME##_cuda(TensorList tensors) {   \
    check_foreach_api_restrictions(tensors);                             \
    bool has_integral = false;                                           \
    for (auto t : tensors) {                                             \
        if (at::isIntegralType(t.scalar_type(), /*includeBool=*/true)) { \
            has_integral = true;                                         \
        }                                                                \
    }                                                                    \
                                                                         \
    /* MTA doesnt support different return type than input one*/         \
    if (!can_use_fast_route(tensors) || has_integral) {                  \
        return at::native::foreach_tensor_##NAME##_slow(tensors);        \
    }                                                                    \
                                                                         \
    return floating_complex_half_bfloat16<NAME1>(tensors);               \
}                                                                        \
                                                                         \
void foreach_tensor_##NAME##_cuda_(TensorList tensors) {                 \
    check_foreach_api_restrictions(tensors);                             \
    bool has_integral = false;                                           \
    for (auto t : tensors) {                                             \
        if (at::isIntegralType(t.scalar_type(), /*includeBool=*/true)) { \
            has_integral = true;                                         \
        }                                                                \
    }                                                                    \
                                                                         \
    /* MTA doesnt support different return type than input one*/         \
    if (!can_use_fast_route(tensors) || has_integral) {                  \
        return at::native::foreach_tensor_##NAME##_slow_(tensors);       \
    }                                                                    \
                                                                         \
    floating_complex_half_bfloat16_<NAME1>(tensors);                     \
}

#define FLOATING_HALF(NAME, NAME1)                                   \
template<typename T>                                                    \
struct NAME1 {                                                          \
    __device__ T operator()(T t) const { return std::NAME(t); }         \
};                                                                      \
                                                                        \
std::vector<Tensor> foreach_tensor_##NAME##_cuda(TensorList tensors) {  \
    check_foreach_api_restrictions(tensors);                            \
    if (!can_use_fast_route(tensors)) {                                 \
        return at::native::foreach_tensor_##NAME##_slow(tensors);       \
    }                                                                   \
                                                                        \
    return floating_half<NAME1>(tensors);                            \
}                                                                       \
                                                                        \
void foreach_tensor_##NAME##_cuda_(TensorList tensors) {                \
    check_foreach_api_restrictions(tensors);                            \
    if (!can_use_fast_route(tensors)) {                                 \
        return at::native::foreach_tensor_##NAME##_slow_(tensors);      \
    }                                                                   \
                                                                        \
    floating_half_<NAME1>(tensors);                                  \
}

#define FOREACH_UNARY_OP_BFLOAT16(NAME, NAME1)                          \
template<typename T>                                                    \
struct NAME1 {                                                          \
    __device__ T operator()(T t) const { return std::NAME(t); }         \
};                                                                      \
                                                                        \
std::vector<Tensor> foreach_tensor_##NAME##_cuda(TensorList tensors) {  \
    check_foreach_api_restrictions(tensors);                            \
                                                                        \
    if (!can_use_fast_route(tensors)) {                                 \
        return at::native::foreach_tensor_##NAME##_slow(tensors);       \
    }                                                                   \
                                                                        \
    return foreach_unary_op_bfloat16<NAME1>(tensors);                   \
}                                                                       \
                                                                        \
void foreach_tensor_##NAME##_cuda_(TensorList tensors) {                \
    check_foreach_api_restrictions(tensors);                            \
                                                                        \
    if (!can_use_fast_route(tensors)) {                                 \
        return at::native::foreach_tensor_##NAME##_slow_(tensors);      \
    }                                                                   \
                                                                        \
    foreach_unary_op_bfloat16_<NAME1>(tensors);                         \
}

FLOATING_HALF(erfc, Erfc);
FLOATING_HALF(expm1, Expm1);
FLOATING_HALF(lgamma, Lgamma);

FOREACH_UNARY_OP_BFLOAT16(log1p, Log1p);
FOREACH_UNARY_OP_BFLOAT16(erf, Erf);

FLOATING_complex_half(acos, Acos);
FLOATING_complex_half(asin, Asin);
FLOATING_complex_half(atan, Atan);
FLOATING_complex_half(cosh, Cosh);
FLOATING_complex_half(tan, Tan);
FLOATING_complex_half(sin, Sin);
FLOATING_complex_half(sinh, Sinh);

FLOATING_complex_half_bfloat16(exp, Exp);
FLOATING_complex_half_bfloat16(tanh, Tanh);
FLOATING_complex_half_bfloat16(log, Log);
FLOATING_complex_half_bfloat16(log10, Log10);
FLOATING_complex_half_bfloat16(log2, Log2);
FLOATING_complex_half_bfloat16(cos, Cos);

//
// Special cases
//
std::vector<Tensor> foreach_tensor_neg_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    TORCH_CHECK(tensors[0].scalar_type() != kBool,
              "Negation, the `-` operator, on a bool tensor is not supported. "
              "If you are trying to invert a mask, use the `~` or `logical_not()` operator instead.");

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_neg_slow(tensors);
    }

    return foreach_unary_op_all_complex_half_bfloat16<std::negate>(tensors);
}

void foreach_tensor_neg_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    TORCH_CHECK(tensors[0].scalar_type() != kBool,
              "Negation, the `-` operator, on a bool tensor is not supported. "
              "If you are trying to invert a mask, use the `~` or `logical_not()` operator instead.");

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_neg_slow_(tensors);
    }

    foreach_unary_op_all_complex_half_bfloat16_<std::negate>(tensors);
}

template<typename T>
struct Sqrt {
    __device__ T operator()(T t) const { return std::sqrt(t); }
};

std::vector<Tensor> foreach_tensor_sqrt_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    bool has_integral = false;
    for (auto t : tensors) {
        if (at::isIntegralType(t.scalar_type(), /*includeBool=*/true)) {
            has_integral = true;
        }
    }

    // MTA doesnt support different return type than input one
    if (!can_use_fast_route(tensors) || has_integral) {
        return at::native::foreach_tensor_sqrt_slow(tensors);
    }

    return floating_complex_half_bfloat16<Sqrt>(tensors);
}

void foreach_tensor_sqrt_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    bool has_integral = false;
    for (auto t : tensors) {
        if (at::isIntegralType(t.scalar_type(), /*includeBool=*/true)) {
            has_integral = true;
        }
    }

    // MTA doesnt support different return type than input one
    if (!can_use_fast_route(tensors) || has_integral) {
        return at::native::foreach_tensor_sqrt_slow_(tensors);
    }

    floating_complex_half_bfloat16_<Sqrt>(tensors);
}

template<typename T>                                                    \
struct Round {                                                          \
    __device__ T operator()(T t) const { return std::nearbyint(t); }    \
};

std::vector<Tensor> foreach_tensor_round_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_round_slow(tensors);
    }

    return floating_half<Round>(tensors);
}

void foreach_tensor_round_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_round_slow_(tensors);
    }

    floating_half_<Round>(tensors);
}

template<typename T>                                               
struct Ceil {                                                      
    __device__ T operator()(T t) const { return std::ceil(t); }    
};

std::vector<Tensor> foreach_tensor_ceil_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    TORCH_CHECK(!tensors[0].is_complex(), "ceil is not supported for complex inputs");

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_ceil_slow(tensors);
    }

    return floating_half<Ceil>(tensors);
}

void foreach_tensor_ceil_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    TORCH_CHECK(!tensors[0].is_complex(), "ceil is not supported for complex inputs");

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_ceil_slow_(tensors);
    }

    floating_half_<Ceil>(tensors);
}

template<typename T>                                               
struct Floor {                                                      
    __device__ T operator()(T t) const { return std::floor(t); }    
};

std::vector<Tensor> foreach_tensor_floor_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    TORCH_CHECK(!tensors[0].is_complex(), "floor is not supported for complex inputs");

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_floor_slow(tensors);
    }

    return floating_half<Floor>(tensors);
}

void foreach_tensor_floor_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    TORCH_CHECK(!tensors[0].is_complex(), "floor is not supported for complex inputs");

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_floor_slow_(tensors);
    }

    floating_half_<Floor>(tensors);
}

// Abs have to go via slow path in case of a complex  or integer type.
// This is because foreach kernels can't return a different dtype than passed, while 
// abs with complex and integer inputs will produce float output.
template<typename T>
struct Abs {
    __device__ T operator()(T t) const { return std::abs(t); }
};

std::vector<Tensor> foreach_tensor_abs_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    bool has_complex_or_integer = false;
    for (auto t : tensors) {
        if (at::isComplexType(t.scalar_type()) || 
            at::isIntegralType(t.scalar_type(), /*includeBool=*/true)) {
            has_complex_or_integer = true;
        }
    }

    if (!can_use_fast_route(tensors) || has_complex_or_integer) {
        return at::native::foreach_tensor_abs_slow(tensors);
    }

    return floating_complex_half_bfloat16<Abs>(tensors);
}

void foreach_tensor_abs_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    bool has_complex_or_integer = false;
    for (auto t : tensors) {
        if (at::isComplexType(t.scalar_type()) || 
            at::isIntegralType(t.scalar_type(), /*includeBool=*/true)) {
            has_complex_or_integer = true;
        }
    }

    if (!can_use_fast_route(tensors) || has_complex_or_integer) {
        return at::native::foreach_tensor_abs_slow_(tensors);
    }

    floating_complex_half_bfloat16_<Abs>(tensors);
}

template<typename T>
struct Trunc {
    __device__ T operator()(T t) const { return t - std::trunc(t); }
};

std::vector<Tensor> foreach_tensor_frac_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_frac_slow(tensors);
    }

    std::vector<std::vector<at::Tensor>> tensor_lists;
    std::vector<at::Tensor> vec_res;
    vec_res.reserve(tensors.size());
    for (const auto& t: tensors) {
        vec_res.emplace_back(at::native::empty_like(t));
    }

    tensor_lists.emplace_back(tensors.vec());
    tensor_lists.emplace_back(std::move(vec_res));

    AT_DISPATCH_FLOATING_TYPES_AND_HALF(tensors[0].scalar_type(), "foreach_unary_op_cuda", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<2>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 2,
                                             /* r_args_depth */ 1,
                                             /* res_arg_index */ 1>(),
                              Trunc<opmath_t>());
    });
    return tensor_lists[1];
}

void foreach_tensor_frac_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_frac_slow_(tensors);
    }

    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_FLOATING_TYPES_AND_HALF(tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1,
                                             /* res_arg_index */ 0>(),
                              Trunc<opmath_t>());
    });
}

template<typename T>
struct Sigmoid {
    T one = T(1);
    __device__ T operator()(T t) const { return (one / (one + std::exp(-t))); }
};

std::vector<Tensor> foreach_tensor_sigmoid_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_sigmoid_slow(tensors);
    }

    std::vector<std::vector<at::Tensor>> tensor_lists;
    std::vector<at::Tensor> vec_res;
    vec_res.reserve(tensors.size());
    for (const auto& t: tensors) {
        vec_res.emplace_back(at::native::empty_like(t));
    }

    tensor_lists.emplace_back(tensors.vec());
    tensor_lists.emplace_back(std::move(vec_res));

    AT_DISPATCH_FLOATING_TYPES_AND2(ScalarType::Half, ScalarType::BFloat16, tensors[0].scalar_type(), "foreach_unary_op_cuda", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<2>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 2,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 1>(),
                              Sigmoid<opmath_t>());
    });
    return tensor_lists[1];
}

void foreach_tensor_sigmoid_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_sigmoid_slow_(tensors);
    }

    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_FLOATING_TYPES_AND2(ScalarType::Half, ScalarType::BFloat16, tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1,
                                             /* res_arg_index */ 0>(),
                              Sigmoid<opmath_t>());
    });
}

template<typename T>
struct Reciprocal {
    T one = T(1);
    __device__ T operator()(T t) const { return (one / t); }
};

std::vector<Tensor> foreach_tensor_reciprocal_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_reciprocal_slow(tensors);
    }

    std::vector<std::vector<at::Tensor>> tensor_lists;
    std::vector<at::Tensor> vec_res;
    vec_res.reserve(tensors.size());
    for (const auto& t: tensors) {
        vec_res.emplace_back(at::native::empty_like(t));
    }

    tensor_lists.emplace_back(tensors.vec());
    tensor_lists.emplace_back(std::move(vec_res));

    AT_DISPATCH_FLOATING_AND_COMPLEX_TYPES_AND2(ScalarType::Half, ScalarType::BFloat16, tensors[0].scalar_type(), "foreach_unary_op_cuda", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<2>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 2,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 1>(),
                              Reciprocal<opmath_t>());
    });
    return tensor_lists[1];
}

void foreach_tensor_reciprocal_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_reciprocal_slow_(tensors);
    }

    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_FLOATING_AND_COMPLEX_TYPES_AND2(ScalarType::Half, ScalarType::BFloat16, tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 0>(),
                              Reciprocal<opmath_t>());
    });
}

template<typename T>
struct Truncf {
    __device__ T operator()(T t) const { return std::truncf(t); }
};

std::vector<Tensor> foreach_tensor_trunc_cuda(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    TORCH_CHECK(!tensors[0].is_complex(), "trunc is not supported for complex inputs");

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_trunc_slow(tensors);
    }

    std::vector<std::vector<at::Tensor>> tensor_lists;
    std::vector<at::Tensor> vec_res;
    vec_res.reserve(tensors.size());
    for (const auto& t: tensors) {
        vec_res.emplace_back(at::native::empty_like(t));
    }

    tensor_lists.emplace_back(tensors.vec());
    tensor_lists.emplace_back(std::move(vec_res));

    AT_DISPATCH_FLOATING_TYPES_AND_HALF(tensors[0].scalar_type(), "foreach_unary_op_cuda", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<2>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 2,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 1>(),
                              Truncf<opmath_t>());
    });
    return tensor_lists[1];
}

void foreach_tensor_trunc_cuda_(TensorList tensors) {
    check_foreach_api_restrictions(tensors);
    TORCH_CHECK(!tensors[0].is_complex(), "trunc is not supported for complex inputs");

    if (!can_use_fast_route(tensors)) {
        return at::native::foreach_tensor_trunc_slow_(tensors);
    }

    std::vector<std::vector<at::Tensor>> tensor_lists;
    tensor_lists.emplace_back(tensors.vec());

    AT_DISPATCH_FLOATING_TYPES_AND_HALF(tensors[0].scalar_type(), "foreach_unary_op_cuda_", [&]() {
        using opmath_t = get_opmath_t<scalar_t>::opmath_t;
        multi_tensor_apply<1>(tensor_lists,
                              UnaryOpFunctor<scalar_t,
                                             /* depth */ 1,
                                             /* r_args_depth */ 1, 
                                             /* res_arg_index */ 0>(),
                              Truncf<opmath_t>());
    });
}

}} // namespace at::native
