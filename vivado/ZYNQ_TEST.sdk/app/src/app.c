#include "xparameters.h"
#include "xil_io.h"
#include "unistd.h"

int main(void)
{
	size_t x, y;

	usleep(5000000);
	for (x = 0; x < 1280; x++) {
		for (y = 0; y < 720; y++) {
			Xil_Out32(0x30000000 + (x + y * 1280) * 4, 0x00ff00);
		}
	}
	return 0;
}
