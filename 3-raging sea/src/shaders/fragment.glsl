uniform vec3 deepColor;
uniform vec3 surfaceColor;
varying float vElevation;

void main(){
    vec3 color = mix(surfaceColor,deepColor, vElevation * 5.0 + 0.10);

    gl_FragColor = vec4(color, 1.0);
     #include <colorspace_fragment>
} 