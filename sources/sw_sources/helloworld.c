/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
/***************************** Include Files *********************************/

#include "xparameters.h"
#include "xiic.h"
#include "xil_io.h"
#include "xiic_l.h"

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define IIC_BASE_ADDRESS	XPAR_IIC_3_BASEADDR

//#define IIC_HTG_OSC_BASE_ADDRESS	XPAR_IIC_1_BASEADDR
#define IIC_HTG_SFPS3_BASE_ADDRESS	XPAR_IIC_2_BASEADDR
#define IIC_HTG_SFPS0_BASE_ADDRESS	XPAR_IIC_1_BASEADDR


/*
 * The following constant defines the address of the IIC
 * temperature sensor device on the IIC bus.  Note that since
 * the address is only 7 bits, this  constant is the address divided by 2.
 */
#define TCA9548_I2CMUX_ADDRESS  0x74 /* The actual address is 0x30 */
#define SI_570_I2C_ADDRESS 0x5D /* The actual address is 0x96 */
#define SFP_EEPROM_0_I2C_ADDRESS 0x50 /* The actual address is 0xA0 */
#define SFP_EEPROM_1_I2C_ADDRESS 0x51 /* The actual address is 0xA2 */


#define TCA9548_I2CMUX_EN_CHANNEL 0x04
#define EEPROM_TEST_START_ADDRESS	0x7F

#define HTG_SI_570_I2C_ADDRESS 0x55 /* The actual address is 0x96 */
#define HTG_SFPS3_I2C_ADDRESS 0x50 /* The actual address is 0x96 */
#define HTG_SFPS0_I2C_ADDRESS 0x6E/* The actual address is 0x96 */

/**************************** Type Definitions *******************************/
#define PAGE_SIZE	16

/***************** Macros (Inline Functions) Definitions *********************/


/************************** Function Prototypes ******************************/

int si570ClkConfig(u32 i2cBaseAddress,
				u8 si570i2cAddress,
				u8 *si570i2cPtr,
				u8 numBytes );

int i2cMuxEnChnl(u32 i2cBaseAddress,
				u8 i2cMuxAddress,
				u8 *i2cMuxEnChnlPtr);

u8 EepromReadByte(u32 I2C_Base_Address, u8 EepromIicAddr, u8 readStartAddr, u8 *BufferPtr, u8 ByteCount);

u8 EepromWriteByte(u32 I2C_Base_Address, u8 EepromIicAddr, u8 writeStartAddr, u8 *BufferPtr, u8 ByteCount);

/************************** Variable Definitions *****************************/
typedef u8 AddressType;

/*****************************************************************************/
/**
*
* The purpose of this function is to illustrate how to use the IIC level 0
* driver to read the temperature.
*
* @param	None
*
* @return	Always 0
*
* @note
*
* The main function is returning an integer to prevent compiler warnings.
*
****************************************************************************/

int main()
{

	u8 si570i2cPtr[15], outbyte, inbyte=0x00;
	u8 htg_si570i2cPtr[15];
	u8 htg_sfpS3i2cPtr[15];
	u8 i2cMuxEnChnlPtr = TCA9548_I2CMUX_EN_CHANNEL;
	int status =0;
    init_platform();
    u8 BufferPtr[2] = {0x02, 0x00};
    u8 readStartAddr;

    print("Hello World\n\r");
    u8 numBytes = 3;

    /* set the TCA9548 Mux to enable the particular channel*/
	status = i2cMuxEnChnl(IIC_BASE_ADDRESS, TCA9548_I2CMUX_ADDRESS, &i2cMuxEnChnlPtr);

	/* check whether the sfp+ transceiver attached to CVR-QSFP module is tunable*/
	readStartAddr = 0x41; // byte no. 65 in address 0x50 in sff8690
	status = EepromReadByte(IIC_BASE_ADDRESS, SFP_EEPROM_0_I2C_ADDRESS, readStartAddr, &outbyte, 1 );

	if(0){ //this if statement is just for experiment!!
		status = EepromWriteByte(IIC_BASE_ADDRESS, SFP_EEPROM_1_I2C_ADDRESS, 0x7F, &inbyte, 1);
	}

	if(((outbyte & (u8)0x40)>>6) == 1){
		print("The SFP+ transceiver attached to CVR-QSFP module is tunable\n\r");
		print("Checking Page select byte... (byte no. 127 in eeprom address 0xA2)\n\r");
		status = EepromReadByte(IIC_BASE_ADDRESS, SFP_EEPROM_1_I2C_ADDRESS, 0x7F, &outbyte, 1 );
		if(outbyte==0x02){
			print("Page select byte already set to 0x02h\n\r");
		}else if((outbyte==0x00)||(outbyte==0x01)){
			print("Changing Page select byte to 0x02h...\n\r");
			status = EepromWriteByte(IIC_BASE_ADDRESS, SFP_EEPROM_1_I2C_ADDRESS, 0x7F, &BufferPtr[0], 1);
			print("Reading back Page select byte to verify...\n\r");
			status = EepromReadByte(IIC_BASE_ADDRESS, SFP_EEPROM_1_I2C_ADDRESS, 0x7F, &si570i2cPtr[0], numBytes );
			if(si570i2cPtr[0]==0x02){
				print("Page select byte set to 0x02h successfully!\n\r");
			}else{
				print("ERROR in Setting Page select byte to 0x02h!\n\r");
			}
		}else{
			print("Page select byte is wrongly set. Changing it to 0x00h\n\r");
		}
	}else{
		print("Wavelength tuning not possible.!! The sfp+ transceiver attached to CVR-QSFP module is not tunable\n\r");
	}
	//******Changing the wavelength now to 1556.55 (0x792C for wavelength 1556.55)
	//(0x78C8 for wavelength 1546.12)
	numBytes = 2;
	BufferPtr[0] = 0x78; //78
	BufferPtr[1] = 0xC8; //C8
	status = EepromWriteByte(IIC_BASE_ADDRESS, SFP_EEPROM_1_I2C_ADDRESS, 0x92, &BufferPtr[0], numBytes);
	print("Wavelength set to 1556.55 successfully!\n\r");

	//status = si570ClkConfig(IIC_HTG_OSC_BASE_ADDRESS, HTG_SI_570_I2C_ADDRESS, &htg_si570i2cPtr[0]);
	status = si570ClkConfig(IIC_HTG_SFPS0_BASE_ADDRESS, HTG_SFPS0_I2C_ADDRESS, &htg_sfpS3i2cPtr[0], numBytes);
	cleanup_platform();
    return 0;
}

/*****************************************************************************/
/**
*
* The function reads the temperature of the IIC temperature sensor on the
* IIC bus using the low-level driver.
*
* @param	IicBaseAddress is the base address of the device.
* @param	TempSensorAddress is the address of the Temperature Sensor device
*		on the IIC bus.
* @param	TemperaturePtr is the databyte read from the temperature sensor.
*
* @return	The number of bytes read from the temperature sensor, normally one
*		byte if successful.
*
* @note		None.
*
****************************************************************************/
int i2cMuxEnChnl(u32 i2cBaseAddress, u8  i2cMuxAddress, u8 *i2cMuxEnChnlPtr){
	int ByteCount;
	ByteCount = XIic_Send(i2cBaseAddress, i2cMuxAddress, i2cMuxEnChnlPtr, 1, XIIC_STOP);
	return ByteCount;
}

int si570ClkConfig(u32 i2cBaseAddress, u8  si570i2cAddress, u8 *si570i2cPtr, u8 numBytes ){
	int ByteCount;
	u8 readStartAddr = EEPROM_TEST_START_ADDRESS;
	ByteCount = EepromReadByte(i2cBaseAddress, si570i2cAddress, readStartAddr, si570i2cPtr, numBytes);
	return ByteCount;
}

/******************************************************************************
*
* This function reads a number of bytes from the IIC serial EEPROM into a
* specified buffer.
*
* @param	BufferPtr contains the address of the data buffer to be filled.
* @param	ByteCount contains the number of bytes in the buffer to be read.
*		This value is constrained by the page size of the device such
*		that up to 64K may be read in one call.
*
* @return	The number of bytes read. A value less than the specified input
*		value indicates an error.
*
* @note		None.
*
******************************************************************************/
u8 EepromReadByte(u32 I2C_Base_Address, u8 EepromIicAddr, u8 readStartAddr, u8 *BufferPtr, u8 ByteCount)
{
	u8 ReceivedByteCount;
	u8 SentByteCount;
	u16 StatusReg;
	AddressType Address = readStartAddr;

	/*
	 * Position the Read pointer to specific location in the EEPROM.
	 */
	do {
		StatusReg = XIic_ReadReg(I2C_Base_Address, XIIC_SR_REG_OFFSET);
		if (!(StatusReg & XIIC_SR_BUS_BUSY_MASK)) {
			SentByteCount = XIic_DynSend(I2C_Base_Address,
							EepromIicAddr,
							(u8 *) &Address,
							sizeof(Address),
							XIIC_STOP);
		}

	} while (SentByteCount != sizeof(Address));

	StatusReg = XIic_ReadReg(I2C_Base_Address, XIIC_SR_REG_OFFSET);

	while ((StatusReg & XIIC_SR_BUS_BUSY_MASK)) {
		StatusReg = XIic_ReadReg(I2C_Base_Address, XIIC_SR_REG_OFFSET);
	}

	do {
		/*
		 * Receive the data.
		 */
		ReceivedByteCount = XIic_DynRecv(I2C_Base_Address,
						 EepromIicAddr, BufferPtr,
						 ByteCount);
	} while (ReceivedByteCount != ByteCount);

	/*
	 * Return the number of bytes received from the EEPROM.
	 */
	return ReceivedByteCount;
}


/*****************************************************************************/
/**
* This function writes a buffer of bytes to the IIC serial EEPROM.
*
* @param	BufferPtr contains the address of the data to write.
* @param	ByteCount contains the number of bytes in the buffer to be
*		written. Note that this should not exceed the page size of the
*		EEPROM as noted by the constant PAGE_SIZE.
*
* @return	The number of bytes written, a value less than that which was
*		specified as an input indicates an error.
*
* @note		one.
*
******************************************************************************/
u8 EepromWriteByte(u32 I2C_Base_Address, u8 EepromIicAddr, u8 writeStartAddr, u8 *BufferPtr, u8 ByteCount)
{
	u8 SentByteCount;
	AddressType Address = writeStartAddr;
	u8 WriteBuffer[sizeof(Address) + PAGE_SIZE];
	u8 Index;

	/*
	 * A temporary write buffer must be used which contains both the address
	 * and the data to be written, put the address in first based upon the
	 * size of the address for the EEPROM
	 */
	if (sizeof(AddressType) == 2) {
		WriteBuffer[0] = (u8) (Address >> 8);
		WriteBuffer[1] = (u8) (Address);
	} else if (sizeof(AddressType) == 1) {
		WriteBuffer[0] = (u8) (Address);
		EepromIicAddr |= (EEPROM_TEST_START_ADDRESS >> 8) & 0x7;
	}

	/*
	 * Put the data in the write buffer following the address.
	 */
	for (Index = 0; Index < ByteCount; Index++) {
		WriteBuffer[sizeof(Address) + Index] = BufferPtr[Index];
	}

	/*
	 * Write a page of data at the specified address to the EEPROM.
	 */
	SentByteCount = XIic_DynSend(IIC_BASE_ADDRESS, EepromIicAddr,
				WriteBuffer, sizeof(Address) + ByteCount,
				XIIC_STOP);

	/*
	 * Return the number of bytes written to the EEPROM.
	 */
	return SentByteCount - sizeof(Address);
}


