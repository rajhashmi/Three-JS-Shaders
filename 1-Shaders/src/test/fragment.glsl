
varying float vRandom;
uniform float uTime;
uniform sampler2D uTexture;
varying vec2 vuv;

void main()
{
    vec4 textureColor = texture2D(uTexture, vuv);
    gl_FragColor = textureColor;
}