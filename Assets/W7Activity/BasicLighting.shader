Shader "ShaderGraphs/BasicLighting"
{
    SubShader
    {
        Tags { "RenderType" = "Opaque" "RenderPipeline" = "UniversalPipeline" }

        Pass
        {
            HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"

            struct Attributes
            {
                float4 positionOS : POSITION;
                float3 normalOS : NORMAL;
            };

            struct Varyings
            {
                float4 positionHCS : SV_POSITION;
                half lighting : TEXCOORD0;
            };

            Varyings vert(Attributes input)
            {
                Varyings output;
                VertexPositionInputs positionInputs = GetVertexPositionInputs(input.positionOS.xyz);
                VertexNormalInputs normalInputs = GetVertexNormalInputs(input.normalOS);
                Light mainLight = GetMainLight();

                output.positionHCS = positionInputs.positionCS;
                output.lighting = saturate(dot(normalInputs.normalWS, -mainLight.direction));
                return output;
            }

            half4 frag(Varyings input) : SV_Target
            {
                return half4(input.lighting, input.lighting, input.lighting, 1.0);
            }
            ENDHLSL
        }
    }
}
