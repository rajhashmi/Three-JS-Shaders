attribute float aRandom;
varying float vRandom;
uniform float uTime;
// attribute vec2 uv;
varying vec2 vuv;
void main()
{
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    modelPosition.z += (aRandom * 0.1) * cos(uTime);
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    

    vRandom = aRandom;
    vuv = uv;
    gl_Position = projectedPosition;
}