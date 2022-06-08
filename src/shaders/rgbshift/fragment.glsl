uniform float uProgress;
uniform float uTime;

uniform sampler2D uImage;
uniform sampler2D uDisplacement;

varying vec2 vUv;

void main() {    

    vec4 displace = texture2D(uDisplacement, vUv);

    vec2 displacedUv = vec2( 
        vUv.x, 
        vUv.y
    );

    displacedUv.y = mix(vUv.y, ( displace.r - 0.2 ), uProgress);

    vec4 color = texture2D(uImage, displacedUv);

    color.r = texture2D(uImage, displacedUv + vec2(0.0, 10. * 0.005) * (uProgress * sin(uTime) * 2.)).r;
    color.g = texture2D(uImage, displacedUv + vec2(0.0, 10. * 0.015) * (uProgress * sin(uTime) * 2.)).g;
    color.b = texture2D(uImage, displacedUv + vec2(0.0, 10. * 0.02)  * (uProgress * sin(uTime) * 2.)).b;

    gl_FragColor = color;
}