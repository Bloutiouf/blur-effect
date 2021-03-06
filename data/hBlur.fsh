#version 330

in vec2 texCoord;

out vec4 fragColor;

uniform sampler2D texture;
uniform vec2 resolution;

void main() {
	float blurSize = 1.0 / resolution.x;
	
	vec4 sum = vec4(0.0);
	sum += texture2D(texture, vec2(texCoord.x - 5.0 * blurSize, texCoord.y)) * 0.01;
	sum += texture2D(texture, vec2(texCoord.x - 4.0 * blurSize, texCoord.y)) * 0.05;
	sum += texture2D(texture, vec2(texCoord.x - 3.0 * blurSize, texCoord.y)) * 0.09;
	sum += texture2D(texture, vec2(texCoord.x - 2.0 * blurSize, texCoord.y)) * 0.12;
	sum += texture2D(texture, vec2(texCoord.x -       blurSize, texCoord.y)) * 0.15;
	sum += texture2D(texture, vec2(texCoord.x                 , texCoord.y)) * 0.16;
	sum += texture2D(texture, vec2(texCoord.x +       blurSize, texCoord.y)) * 0.15;
	sum += texture2D(texture, vec2(texCoord.x + 2.0 * blurSize, texCoord.y)) * 0.12;
	sum += texture2D(texture, vec2(texCoord.x + 3.0 * blurSize, texCoord.y)) * 0.09;
	sum += texture2D(texture, vec2(texCoord.x + 4.0 * blurSize, texCoord.y)) * 0.05;
	sum += texture2D(texture, vec2(texCoord.x + 5.0 * blurSize, texCoord.y)) * 0.01;
	
	fragColor = sum;
}