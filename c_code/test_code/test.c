#include <stdlib.h>
#include <stdio.h>

union{
	float f;
	unsigned int i;
} val;

int main(int argc, char** argv)
{
	int seed = 34783;

	srand48(seed);
	val.f = drand48();

	printf("Float: %f \n", val.f);
	printf("Casted: %d \n", val.i);

	return 0;
}
