/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2025 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "tim.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "arm_math.h"
#include "transporter_config.h"
#include "signal_generator.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */
int range3 = 0, range4 = 0;
uint32_t msCounter = 0;
const uint32_t DIRECTION_CHANGE_INTERVAL = 200; // 3 seconds in milliseconds
uint8_t motorDirection = 0; // 0 for positive, 1 for negative
float setpoint = 0;
float filteredValue = 0;
float cmd_vel = 0;

SignalGenerator sine_sg;
SignalGenerator chirp_linear_sg;
SignalGenerator chirp_log_sg;
SignalGenerator square_sg;
SignalGenerator ramp_sg;

float sine_sample = 0.0f;
float chirp_Linear_sample = 0.0f;
float chirp_log_sample = 0.0f;
float square_sample = 0.0f;
float ramp_sample = 0.0f;/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{

  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_TIM3_Init();
  MX_TIM4_Init();
  MX_TIM5_Init();
  MX_TIM20_Init();
  MX_TIM8_Init();
  MX_TIM2_Init();
  /* USER CODE BEGIN 2 */
	transporter_begin();

	  // 1. Sine Wave Example
	  SIGNAL_init(&sine_sg, SIGNAL_SINE);
	  SIGNAL_config_sine(&sine_sg,
	      0.7f/3.0f,    // Amplitude
	      1.0f,         // Frequency
	      0.0f,         // Phase
	      0.0f,         // Offset
	      -0.7f/3.0f,   // Min Setpoint
	      0.7f/3.0f     // Max Setpoint
	  );

	  // 2. Chirp Wave Example (Linear)
	  SIGNAL_init(&chirp_linear_sg, SIGNAL_CHIRP);
	  SIGNAL_config_chirp(&chirp_linear_sg,
	      0.7f/3.0f,        // Amplitude
	      1.0f,             // Start Frequency
	      10.0f,            // End Frequency
	      5.0f,             // Duration (seconds)
	      CHIRP_LINEAR,     // Chirp Type
	      -0.7f/3.0f,       // Min Setpoint
	      0.7f/3.0f         // Max Setpoint
	  );

	  // 3. Chirp Wave Example (Logarithmic)
	  SIGNAL_init(&chirp_log_sg, SIGNAL_CHIRP);
	  SIGNAL_config_chirp(&chirp_log_sg,
	      0.7f/3.0f,            // Amplitude
	      1.0f,                 // Start Frequency
	      10.0f,                // End Frequency
	      5.0f,                 // Duration (seconds)
	      CHIRP_LOGARITHMIC,    // Chirp Type
	      -0.7f/3.0f,           // Min Setpoint
	      0.7f/3.0f             // Max Setpoint
	  );

	  // 4. Square Wave Example
	  SIGNAL_init(&square_sg, SIGNAL_SQUARE);
	  SIGNAL_config_square(&square_sg,
	      0.7f/3.0f,    // Amplitude
	      2.0f,         // Frequency
	      0.3f,         // Duty Cycle (30%)
	      0.0f,         // Phase
	      0.0f,         // Offset
	      -0.7f/3.0f,   // Min Setpoint
	      0.7f/3.0f     // Max Setpoint
	  );

	  // 5. Ramp Wave Example
	  SIGNAL_init(&ramp_sg, SIGNAL_RAMP);
	  SIGNAL_config_ramp(&ramp_sg,
	      0.7f/3.0f,    // Amplitude
	      1.0f,         // Frequency
	      -0.7f/3.0f,   // Ramp Start
	      0.7f/3.0f,    // Ramp End
	      0.0f,         // Phase
	      0.0f,         // Offset
	      -0.7f/3.0f,   // Min Setpoint
	      0.7f/3.0f     // Max Setpoint
	  );

  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
	while (1) {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
	}
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1_BOOST);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLM = RCC_PLLM_DIV4;
  RCC_OscInitStruct.PLL.PLLN = 85;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
  RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
    if (htim == &htim2) {
        QEI_get_diff_count(&encoder3);
        QEI_compute_data(&encoder3);

        QEI_get_diff_count(&encoder4);
        QEI_compute_data(&encoder4);

        sine_sample = SIGNAL_generate(&sine_sg, 0.001f);
        chirp_Linear_sample = SIGNAL_generate(&chirp_linear_sg, 0.001f);
        chirp_log_sample = SIGNAL_generate(&chirp_log_sg, 0.001f);
		square_sample = SIGNAL_generate(&square_sg, 0.001f);
		ramp_sample = SIGNAL_generate(&ramp_sg, 0.001f);

		setpoint = sine_sample;

        filteredValue = FIR_process(&lowPassFilter, encoder4.radps);
        cmd_vel = PWM_Satuation(PID_CONTROLLER_Compute(&pid4, setpoint - filteredValue), 65535, -65535);
        MDXX_set_range(&motor4, 2000, cmd_vel);
    }
}
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	__disable_irq();
	while (1) {
	}
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
