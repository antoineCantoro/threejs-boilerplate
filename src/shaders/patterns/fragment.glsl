uniform vec3 uColor;
uniform sampler2D uTexture;

varying vec2 vUv;

float random(vec2 st){
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43753.5453123);
    // return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

void main() {    

    // vec2 position = gl_FragCoord.xy;

    float strength = vUv.x;
    float test = vUv.y;

    gl_FragColor = vec4(1.0, 1.0, 1.0, 1.0);

    // vec3 color = vec3(1.0);
    // gl_FragColor = vec4(color, 1.0);

    // Bruno Simons Exercice patterns

    // Pattern 01
    // gl_FragColor = vec4(vUv.x, vUv.y, 1.0, 1.0);
    // OR gl_FragColor = vec4(vUv, 1.0, 1.0);

    // Pattern 02
    // gl_FragColor = vec4(vUv, 0.0, 1.0);
    
    // Pattern 03
    // gl_FragColor = vec4(strength, strength, strength, 1.0);
   
    // Pattern 04
    // gl_FragColor = vec4(test, test, test, 1.0);
    
    // Pattern 05
    // gl_FragColor = vec4(1.0 - test, 1.0 - test, 1.0 - test, 1.0);
    
    // Pattern 06
    // gl_FragColor = vec4(10.0 * test, 10.0 * test, 10.0 * test, 1.0);
    
    // Pattern 07
    // test = mod(vUv.y * 10.0, 1.0);
    // gl_FragColor = vec4(test, test, test, 1.0);
    
    // Pattern 08
    // test = mod(vUv.y * 10.0, 1.0);
    // test = step(0.5, test);
    // gl_FragColor = vec4(test, test, test, 1.0);
    
    // Pattern 09
    // test = mod(vUv.y * 10.0, 1.0);
    // test = step(0.8, test);
    // gl_FragColor = vec4(test, test, test, 1.0);
    
    // Pattern 10
    // test = mod(vUv.x * 10.0, 1.0);
    // test = step(0.8, test);
    // gl_FragColor = vec4(test, test, test, 1.0);
    
    // Pattern 11
    
    // // My way
    // float testx = mod(vUv.x * 10.0, 1.0);
    // testx = step(0.8, testx);

    // float testy = mod(vUv.y * 10.0, 1.0);
    // testy = step(0.8, testy);

    // // Proper way
    // strength =  step(0.8, mod(vUv.x * 10.0, 1.0) );
    // strength += step(0.8, mod(vUv.y * 10.0, 1.0) );

    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    
    // Pattern 12

    // My way
    // strength =  step(0.9, mod(vUv.x * 10.0, 1.0) );
    // strength -= step(0.1, mod(vUv.y * 10.0, 1.0) );

    // // Solution
    // strength =  step(0.8, mod(vUv.x * 10.0, 1.0) );
    // strength *= step(0.8, mod(vUv.y * 10.0, 1.0) );

    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    
    // Pattern 13
    // strength =  step(0.4, mod(vUv.x * 10.0, 1.0) );
    // strength *= step(0.8, mod(vUv.y * 10.0, 1.0) );

    // gl_FragColor = vec4(strength, strength, strength, 1.0);
    
    // Pattern 14
    // float barX =  step(0.3, mod(vUv.x * 10.0, 1.0) );
    // barX *= step(0.8, mod(vUv.y * 10.0, 1.0) );

    // float barY =  step(0.8, mod(vUv.x * 10.0, 1.0) );
    // barY *= step(0.3, mod(vUv.y * 10.0, 1.0) );
    
    // float bar = barX + barY;
    // gl_FragColor = vec4(bar, bar, bar, 1.0);
    
    // Pattern 15
    // float barX =  step(0.4, mod(vUv.x * 10.0 - 0.2, 1.0) );
    //       barX *= step(0.8, mod(vUv.y * 10.0, 1.0) );

    // float barY =  step(0.8, mod(vUv.x * 10.0, 1.0) );
    //       barY *= step(0.4, mod(vUv.y * 10.0 - 0.2, 1.0) );

    // float bar = barX + barY;
    // gl_FragColor = vec4(bar, bar, bar, 1.0);
    
    // Pattern 16
    // float value = abs(sin(vUv.x - 0.5));
    // float value = abs(vUv.x - 0.5);
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 17
    // My test : 
    // float value = abs(vUv.x - 0.5) * abs(vUv.y - 0.5);
    // Correction :
    // float value = min(abs(vUv.x - 0.5), abs(vUv.y - 0.5));
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    
    // Pattern 18
    // float value = max(abs(vUv.x - 0.5), abs(vUv.y - 0.5));
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 19
    // float value = step(0.25, abs(vUv.x - 0.5));
    //       value += step(0.25, abs(vUv.y - 0.5));
    // float value = step(0.25, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 20
    // float value = 1.0 - step(0.25, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // value *= step(0.2, max(abs(vUv.x - 0.5), abs(vUv.y - 0.5)));
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 21
    // float value = floor(vUv.x * 10.0) / 10.0;
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 22
    // float value = floor(vUv.x * 10.0) / 10.0;
    //       value *= floor(vUv.y * 10.0) / 10.0;
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 23
    // float value = random(vUv);
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 24
    // vec2 gridUv = vec2(
    //     floor(vUv.x * 10.0) / 10.0, 
    //     floor(vUv.y * 10.0) / 10.0
    // );
    // float value = random(gridUv);
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 25
    // vec2 gridUv = vec2(
    //     floor(vUv.x * 10.0) / 10.0, 
    //     floor((vUv.y + vUv.x * 0.5) * 10.0) / 10.0
    // );
    // float value = random(gridUv);
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 26
    // float value = length(vUv);
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 27
    // Solution 1 : float value = length(vUv - 0.5);
    // Solution 2 :
    // float value = distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 28
    // float value = 1.0 - distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 29
    // float value = 0.01 / distance(vUv, vec2(0.5));
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 30
    // vec2 lightUv = vec2(
    //     vUv.x * 0.2 + 0.4,
    //     vUv.y
    // );
    // float value = 0.015 / distance(lightUv, vec2(0.5));
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 31
    // vec2 lightUvX = vec2(vUv.x * 0.1 + 0.45, vUv.y * 0.5 + 0.25 );
    // vec2 lightUvY = vec2(vUv.y * 0.1 + 0.45, vUv.x * 0.5 + 0.25 );
    // float valueX = 0.015 / distance(lightUvX, vec2(0.5));
    // float valueY = 0.015 / distance(lightUvY, vec2(0.5));
    // float value = valueX * valueY;
    // gl_FragColor = vec4(value, value, value, 1.0);
    
    // Pattern 32
    vec2 lightUvX = vec2(vUv.x * 0.1 + 0.45, vUv.y * 0.5 + 0.25 );
    vec2 lightUvY = vec2(vUv.y * 0.1 + 0.45, vUv.x * 0.5 + 0.25 );
    float valueX = 0.015 / distance(lightUvX, vec2(0.5));
    float valueY = 0.015 / distance(lightUvY, vec2(0.5));
    float value = valueX * valueY;
    gl_FragColor = vec4(value, value, value, 1.0);


}