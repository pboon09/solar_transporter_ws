################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Core/Startup/startup_stm32g474retx.s 

OBJS += \
./Core/Startup/startup_stm32g474retx.o 

S_DEPS += \
./Core/Startup/startup_stm32g474retx.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Startup/%.o: ../Core/Startup/%.s Core/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/BasicMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/BayesFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/CommonTables" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/ComplexMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/ControllerFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/DistanceFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/FastMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/FilteringFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/InterpolationFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/MatrixFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/QuaternionMathFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/StatisticsFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/SupportFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/SVMFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/TransformFunctions" -I"/home/transporter/solar_transporter_ws/firmware/transporter_controller/Source/WindowFunctions" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Core-2f-Startup

clean-Core-2f-Startup:
	-$(RM) ./Core/Startup/startup_stm32g474retx.d ./Core/Startup/startup_stm32g474retx.o

.PHONY: clean-Core-2f-Startup

