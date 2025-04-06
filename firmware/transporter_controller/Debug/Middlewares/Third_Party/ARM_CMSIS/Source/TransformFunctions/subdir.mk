################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctions.c \
../Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctionsF16.c 

OBJS += \
./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctions.o \
./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctionsF16.o 

C_DEPS += \
./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctions.d \
./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctionsF16.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/%.o Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/%.su Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/%.cyclo: ../Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/%.c Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros/include -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/ARM_CMSIS/CMSIS/Core/Include/ -I../Middlewares/Third_Party/ARM_CMSIS/PrivateInclude/ -I../Middlewares/Third_Party/ARM_CMSIS/Include/ -I../Middlewares/Third_Party/ARM_CMSIS/Include -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/BasicMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/BayesFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/CommonTables" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/ComplexMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/ControllerFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/DistanceFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/FastMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/FilteringFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/InterpolationFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/MatrixFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/QuaternionMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/StatisticsFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/SupportFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/SVMFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/TransformFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/WindowFunctions" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-Third_Party-2f-ARM_CMSIS-2f-Source-2f-TransformFunctions

clean-Middlewares-2f-Third_Party-2f-ARM_CMSIS-2f-Source-2f-TransformFunctions:
	-$(RM) ./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctions.cyclo ./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctions.d ./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctions.o ./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctions.su ./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctionsF16.cyclo ./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctionsF16.d ./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctionsF16.o ./Middlewares/Third_Party/ARM_CMSIS/Source/TransformFunctions/TransformFunctionsF16.su

.PHONY: clean-Middlewares-2f-Third_Party-2f-ARM_CMSIS-2f-Source-2f-TransformFunctions

