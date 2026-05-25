Shader "Shader Graphs/TestPostEffect"
{
    Properties
    {
        _EffectTex ("EffectTex", 2D) = "white" {}
    }

    SubShader
    {
        Tags
        {
            "RenderPipeline" = "UniversalPipeline"
            "RenderType" = "Opaque"
            "Queue" = "Overlay"
        }

        Pass
        {
            Name "DrawProcedural"
            Tags { "LightMode" = "DrawProcedural" }
            ZWrite Off
            ZTest Always
            Cull Off

            HLSLPROGRAM
            #pragma vertex Vert
            #pragma fragment Frag

            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"

            #include "Packages/com.unity.render-pipelines.core/Runtime/Utilities/Blit.hlsl"

            TEXTURE2D(_EffectTex);
            SAMPLER(sampler_EffectTex);

            CBUFFER_START(UnityPerMaterial)
                float4 _EffectTex_ST;
            CBUFFER_END

            half4 Frag(Varyings input) : SV_Target
            {
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);
                float2 uv = input.texcoord.xy;
                half4 sourceColor = SAMPLE_TEXTURE2D_X_LOD(_BlitTexture, sampler_LinearClamp, uv, 0);
                half4 effectTex = SAMPLE_TEXTURE2D(_EffectTex, sampler_EffectTex, TRANSFORM_TEX(uv, _EffectTex));
                half4 multiplied = sourceColor * effectTex;
                half t = (sin(_Time.y) + 1.0h) * 0.5h;
                return lerp(sourceColor, multiplied, t);
            }
            ENDHLSL
        }
    }
}
