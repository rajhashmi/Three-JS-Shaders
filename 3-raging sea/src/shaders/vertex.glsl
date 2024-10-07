uniform float waveElevation;
uniform vec2 waveFrequency;
uniform float uTime;

void main (){
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elvation =  sin(modelPosition.x *  waveFrequency.x + uTime) * sin(modelPosition.z *  waveFrequency.y + uTime) * waveElevation;

    modelPosition.y += elvation;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix *  viewPosition;  

    gl_Position = projectedPosition;

}