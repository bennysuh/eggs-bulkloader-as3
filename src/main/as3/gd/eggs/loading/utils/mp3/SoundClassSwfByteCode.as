package gd.eggs.loading.utils.mp3
{
	/**
	 * This class stores the bytecode necessary to generate a SoundClass SWF.
	 * When assembled and loaded, the swf will contain a definition for class SoundClass, that contains the audio.
	 * The way SWF bytecode is generated is by writing data in the following order into a ByteArray:
	 *
	 * soundClassSwfBytes1
	 * UI32: the total size of the SWF in bytes
	 * soundClassSwfBytes2
	 * UI32: the size of the audio data in bytes+7
	 * Byte: 1
	 * Byte: 0
	 * 4 bits: 3 for uncompressed or 2 for mp3
	 * 2 bits: The sample rate. (0=5512.5hZ 1=11025hZ 2=22050hZ 3=44100hZ)
	 * 1 bit: The sample depth. (0=8bit, 1=16bit)
	 * 1 bit: Channels. (0=mono, 1=stereo)
	 * UI32: The number of samples in the audio data (incl seekSamples if mp3)
	 * [SI16 seekSamples]
	 * audio data
	 * soundClassSwfBytes3
	 *
	 * @author spender
	 *
	 */
	internal final class SoundClassSwfByteCode
	{
		internal static const silentMp3Frame:Array = [
			0xFF , 0xFA , 0x92 , 0x40 , 0x78 , 0x05 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00, 0x4B , 0x80 , 0x00 , 0x00 , 0x08 , 0x00 , 0x00 , 0x09 , 0x70 , 0x00 , 0x00, 0x01 , 0x00 , 0x00 , 0x01 , 0x2E , 0x00 , 0x00 , 0x00 , 0x20 , 0x00 , 0x00, 0x25 , 0xC0 , 0x00 , 0x00 , 0x04 , 0xB0 , 0x04 , 0xB1 , 0x00 , 0x06 , 0xBA, 0xA8 , 0x22 , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF, 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF , 0xFF
		];
		internal static const soundClassSwfBytes1:Array = [
			0x46 , 0x57 , 0x53 , 0x09
		];


		internal static const soundClassSwfBytes2:Array = [
			0x78 , 0x00 , 0x05 , 0x5F , 0x00 , 0x00 , 0x0F , 0xA0 , 0x00 , 0x00 , 0x0C , 0x01 , 0x00 , 0x44 , 0x11 , 0x08 , 0x00 , 0x00 , 0x00 , 0x43 , 0x02 , 0xFF , 0xFF , 0xFF , 0xBF , 0x15 , 0x0B , 0x00 , 0x00 , 0x00 , 0x01 , 0x00 , 0x53 , 0x63 , 0x65 , 0x6E , 0x65 , 0x20 , 0x31 , 0x00 , 0x00 , 0xBF , 0x14 , 0xC8 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x00 , 0x10 , 0x00 , 0x2E , 0x00 , 0x00 , 0x00 , 0x00 , 0x08 , 0x0A , 0x53 , 0x6F , 0x75 , 0x6E , 0x64 , 0x43 , 0x6C , 0x61 , 0x73 , 0x73 , 0x00 , 0x0B , 0x66 , 0x6C , 0x61 , 0x73 , 0x68 , 0x2E , 0x6D , 0x65 , 0x64 , 0x69 , 0x61 , 0x05 , 0x53 , 0x6F , 0x75 , 0x6E , 0x64 , 0x06 , 0x4F , 0x62 , 0x6A , 0x65 , 0x63 , 0x74 , 0x0F , 0x45 , 0x76 , 0x65 , 0x6E , 0x74 , 0x44 , 0x69 , 0x73 , 0x70 , 0x61 , 0x74 , 0x63 , 0x68 , 0x65 , 0x72 , 0x0C , 0x66 , 0x6C , 0x61 , 0x73 , 0x68 , 0x2E , 0x65 , 0x76 , 0x65 , 0x6E , 0x74 , 0x73 , 0x06 , 0x05 , 0x01 , 0x16 , 0x02 , 0x16 , 0x03 , 0x18 , 0x01 , 0x16 , 0x07 , 0x00 , 0x05 , 0x07 , 0x02 , 0x01 , 0x07 , 0x03 , 0x04 , 0x07 , 0x02 , 0x05 , 0x07 , 0x05 , 0x06 , 0x03 , 0x00 , 0x00 , 0x02 , 0x00 , 0x00 , 0x00 , 0x02 , 0x00 , 0x00 , 0x00 , 0x02 , 0x00 , 0x00 , 0x01 , 0x01 , 0x02 , 0x08 , 0x04 , 0x00 , 0x01 , 0x00 , 0x00 , 0x00 , 0x01 , 0x02 , 0x01 , 0x01 , 0x04 , 0x01 , 0x00 , 0x03 , 0x00 , 0x01 , 0x01 , 0x05 , 0x06 , 0x03 , 0xD0 , 0x30 , 0x47 , 0x00 , 0x00 , 0x01 , 0x01 , 0x01 , 0x06 , 0x07 , 0x06 , 0xD0 , 0x30 , 0xD0 , 0x49 , 0x00 , 0x47 , 0x00 , 0x00 , 0x02 , 0x02 , 0x01 , 0x01 , 0x05 , 0x1F , 0xD0 , 0x30 , 0x65 , 0x00 , 0x5D , 0x03 , 0x66 , 0x03 , 0x30 , 0x5D , 0x04 , 0x66 , 0x04 , 0x30 , 0x5D , 0x02 , 0x66 , 0x02 , 0x30 , 0x5D , 0x02 , 0x66 , 0x02 , 0x58 , 0x00 , 0x1D , 0x1D , 0x1D , 0x68 , 0x01 , 0x47 , 0x00 , 0x00 , 0xBF , 0x03
		];
		internal static const soundClassSwfBytes3:Array = [
			0x3F , 0x13 , 0x0F , 0x00 , 0x00 , 0x00 , 0x01 , 0x00 , 0x01 , 0x00 , 0x53 , 0x6F , 0x75 , 0x6E , 0x64 , 0x43 , 0x6C , 0x61 , 0x73 , 0x73 , 0x00 , 0x44 , 0x0B , 0x0F , 0x00 , 0x00 , 0x00 , 0x40 , 0x00 , 0x00 , 0x00
		];

	}
}