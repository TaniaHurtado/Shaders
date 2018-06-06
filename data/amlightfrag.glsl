#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D texture;

varying vec3 objectColorv;
varying vec3 lightColorv;
varying vec4 vertColor;
varying vec3 ecNormal;
varying vec3 lightDir;
varying vec4 vertTexCoord;

void main() {

	float ambientStrength = 0.1;
    vec3 ambient = ambientStrength * lightColorv;
    vec3 result = ambient * vec3(vertColor);
    vec4 tintColor = vec4(result, 1.0);
  	gl_FragColor = texture2D(texture, vertTexCoord.st) * tintColor;
}