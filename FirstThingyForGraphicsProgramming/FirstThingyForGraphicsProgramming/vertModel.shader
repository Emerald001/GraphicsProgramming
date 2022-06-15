#version 330 core
layout(location = 0) in vec3 aPos;
layout(location = 1) in vec3 aNormal;
layout(location = 2) in vec2 aTexCoords;
layout(location = 3) in vec2 vUV;

out vec2 TexCoords;
out vec3 Normals;
out vec4 FragPos;

uniform mat4 world;
uniform mat4 view;
uniform mat4 projection;

uniform sampler2D heightMap;

void main()
{
    TexCoords = aTexCoords;
    FragPos = world * vec4(aPos, 1.0);

    vec4 diffuseColor = texture(heightMap, FragPos.xz);
    //FragPos.y += diffuseColor.r * 100;

    gl_Position = projection * view * FragPos;

    // not the most efficient, but it works
    Normals = normalize( mat3(inverse(transpose(world)))* aNormal );
}