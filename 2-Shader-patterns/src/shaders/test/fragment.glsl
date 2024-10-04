varying vec2 vuv;

void main()
{
    gl_FragColor = vec4(vuv.x, vuv.x, vuv.x , 1.0);
}