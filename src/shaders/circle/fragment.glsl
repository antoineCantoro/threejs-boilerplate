uniform vec3 uColor;
uniform sampler2D uTexture;

varying vec2 vUv;


float circleShape(vec2 position, float radius ) {
    return step( radius, length(position - 0.5));
}

void main() {    

    vec2 position = gl_FragCoord.xy;

    float circle = circleShape(vUv, 0.45);

    vec3 color = vec3(circle);

    gl_FragColor = vec4(color, 1.0);
}