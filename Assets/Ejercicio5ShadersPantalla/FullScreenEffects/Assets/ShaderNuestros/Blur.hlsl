#ifndef BLUR_INCLUDED
#define BLUR_INCLUDED

void ApplyBlur_float(UnityTexture2D MainTex, float2 Uv, UnitySamplerState Ss, float2 texelSize, float2 texelOffSet, out float4 Result)
	{
		float kernel[9] = {
			0.0625, 0.125, 0.0625, 
			0.125, 0.25, .0125, 
			0.0625, 0.125, 0.0625};

			Result = 0;

		[unroll(9)]
		for(int y = 1; y > -1; y--)
		{
			for(int x = -1; x < 1; x++)
			{
				Result += SAMPLE_TEXTURE2D(MainTex, Ss, Uv + float2(x,y) * texelSize * texelOffSet) * kernel[(x + 1) + (3 * y + 1)];
				
			}
		}

	}

	#endif