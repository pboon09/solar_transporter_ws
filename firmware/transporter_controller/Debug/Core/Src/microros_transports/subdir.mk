################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Src/microros_transports/dma_transport.c 

OBJS += \
./Core/Src/microros_transports/dma_transport.o 

C_DEPS += \
./Core/Src/microros_transports/dma_transport.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Src/microros_transports/%.o Core/Src/microros_transports/%.su Core/Src/microros_transports/%.cyclo: ../Core/Src/microros_transports/%.c Core/Src/microros_transports/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32G474xx -c -I../Core/Inc -I../micro_ros_stm32cubemx_utils/microros_static_library_ide/libmicroros/include -I../Drivers/STM32G4xx_HAL_Driver/Inc -I../Drivers/STM32G4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32G4xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/Third_Party/ARM_CMSIS/CMSIS/Core/Include/ -I../Middlewares/Third_Party/ARM_CMSIS/PrivateInclude/ -I../Middlewares/Third_Party/ARM_CMSIS/Include/ -I../Middlewares/Third_Party/ARM_CMSIS/Include -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/BasicMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/BayesFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/CommonTables" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/ComplexMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/ControllerFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/DistanceFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/FastMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/FilteringFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/InterpolationFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/MatrixFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/QuaternionMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/StatisticsFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/SupportFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/SVMFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/TransformFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/WindowFunctions" -I../Middlewares/Third_Party/FreeRTOS/Source/include -I../Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2 -I../Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM4F -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Src-2f-microros_transports

clean-Core-2f-Src-2f-microros_transports:
	-$(RM) ./Core/Src/microros_transports/dma_transport.cyclo ./Core/Src/microros_transports/dma_transport.d ./Core/Src/microros_transports/dma_transport.o ./Core/Src/microros_transports/dma_transport.su

.PHONY: clean-Core-2f-Src-2f-microros_transports

