uniform float waveElevation;
uniform vec2 waveFrequency;
uniform float uTime;

varying float vElevation;

void main (){
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);

    float elvation =  sin(modelPosition.x *  waveFrequency.x + uTime) * sin(modelPosition.z *  waveFrequency.y + uTime) * waveElevation;

    modelPosition.y += elvation;

    vElevation = elvation;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix *  viewPosition;  

    gl_Position = projectedPosition;

}