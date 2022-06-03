uniform vec3 uColor;
uniform sampler2D uTexture;

varying vec2 vUv;


float rectangleShape(vec2 position, vec2 scale) {
    scale = vec2(0.5) - scale * 0.5 ;
    vec2 shaper = vec2( step( scale.x, position.x ), step( scale.y, position.y ) );
    shaper *= vec2( step(scale.x, 1.0 - position.x), step( scale.y, 1.0 - position.y) );
    return shaper.x * shaper.y;
}

void main() {    

    vec2 position = gl_FragCoord.xy;

    float rectangle = rectangleShape(position, vec2(1, 1 ) );
    vec3 color = vec3(rectangle);

    gl_FragColor = vec4(color, 1.0);
}