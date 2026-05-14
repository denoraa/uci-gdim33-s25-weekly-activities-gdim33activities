Shader "ShaderGraphs/Fire"
{
    Properties
    {
        _NoiseTexture("NoiseTexture", 2D) = "white" {}
        _Tint("Tint", Color) = (1, 0.35, 0.02, 1)
    }

    SubShader
    {
        Tags { "Queue" = "Transparent" "RenderType" = "Transparent" "RenderPipeline" = "UniversalPipeline" }
        Blend SrcAlpha One
        ZWrite Off
        Cull Off

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            TEXTURE2D(_NoiseTexture);
            SAMPLER(sampler_NoiseTexture);

            CBUFFER_START(UnityPerMaterial)
                float4 _NoiseTexture_ST;
                half4 _Tint;
            CBUFFER_END

            struct Attributes
            {
                float4 positionOS : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            Varyings vert(Attributes input)
            {
                Varyings output;
                output.positionHCS = TransformObjectToHClip(input.positionOS.xyz);
                output.uv = TRANSFORM_TEX(input.uv, _NoiseTexture);
                return output;
            }

            half4 frag(Varyings input) : SV_Target
            {
                float2 animatedUV = float2(input.uv.x, input.uv.y - _Time.y);
                half noise = SAMPLE_TEXTURE2D(_NoiseTexture, sampler_NoiseTexture, animatedUV).r;
                half fadeToTop = saturate(1.0 - input.uv.y);
                half3 color = noise * _Tint.rgb;
                half alpha = noise * fadeToTop * _Tint.a;
                return half4(color, alpha);
            }
            ENDHLSL
        }
    }
}
