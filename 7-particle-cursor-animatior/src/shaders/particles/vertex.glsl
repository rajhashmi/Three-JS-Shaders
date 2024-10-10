uniform vec2 uResolution;
uniform sampler2D uPictureTexture;
varying vec3 vColor;
uniform sampler2D uDisplacementTexture;
attribute float aIntensity;
attribute float aAngle;
void main()
{
    vec3 newPosition = position;
    float displacementIntensity = texture(uDisplacementTexture, uv).r;
    displacementIntensity = smoothstep(0.1, 0.3, displacementIntensity);
    vec3 displacement = vec3(
        cos(aAngle) * 0.2,
        sin(aAngle) * 0.2,
        1
    );
    displacement = normalize(displacement);

    displacement *= displacementIntensity;
    displacement *= 3.0;
    displacement *= aIntensity;

    newPosition += displacement;

    float uPictureIntensity = texture(uPictureTexture, uv).r;


    // Final position
    vec4 modelPosition = modelMatrix * vec4(newPosition, 1.0);
    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;
    gl_Position = projectedPosition;

    vColor = vec3(pow(uPictureIntensity,2.0));;

    // Point size
    gl_PointSize = 0.15 * uPictureIntensity * uResolution.y;
    gl_PointSize *= (1.0 / - viewPosition.z);
}