#pragma once


#include "ANEUtils.h"

static ANEUtils* ANEutils = new ANEUtils();


struct AIRVector {
    
};

static  std::vector<float> ConvertVectorData(FREObject src)
{
    std::vector<float> data_float;

    FREObject data = ANEutils->getObject(src, "data");
    LLGL::Format type = (LLGL::Format)ANEutils->getInt32(src, "format");
    uint32_t length;
    FREGetArrayLength(data, &length);
    for (int i = 0; i < (int)length; ++i) {
        if (type == LLGL::Format::RG32Float) {
            data_float.push_back((float)ANEutils->getDouble(ANEutils->getArrayIndex(data, i)));

        }
        else  if (type == LLGL::Format::RGBA8UNorm) {
            data_float.push_back((float)ANEutils->getInt32(ANEutils->getArrayIndex(data, i)));
        }
    }
    return data_float;
}


static std::vector<std::vector<std::vector<float>>> ConvertArray(FREObject src)
{
    uint32_t length;
    FREGetArrayLength(src, &length);

    std::vector<std::vector<std::vector<float>>> cVector;

    for (int i = 0; i < (int)length; ++i) {
        FREObject item = ANEutils->getArrayIndex(src, i);
        FREObjectType type;
        FREGetObjectType(item, &type);

        if (type == FRE_TYPE_ARRAY)
        {
            uint32_t length2;
            FREGetArrayLength(item, &length2);
            std::vector<std::vector<float>> aVector;
            for (int i2 = 0; i2 < (int)length2; ++i2) {
                FREObject item2 = ANEutils->getArrayIndex(item, i2);
                aVector.push_back(ConvertVectorData(item2));
            }
            cVector.push_back(aVector);
        }
        if (type == FRE_TYPE_OBJECT){

        }
    }
    std::cout << "\n cVector.size=" << cVector.size() << "   sizeof(cVector)=" << sizeof(cVector) << std::endl;
    return cVector;
}


static void Convert(LLGL::VertexAttribute& dst, FREObject src)
{
    dst.name = ANEutils->getString(src,"name");
    dst.format = static_cast<LLGL::Format>(ANEutils->getInt32(src, "format"));
    dst.location = ANEutils->getInt32(src, "location");
    dst.semanticIndex = ANEutils->getInt32(src, "semanticIndex");
    dst.slot = ANEutils->getInt32(src, "slot");
    dst.offset = ANEutils->getInt32(src, "offset");
    dst.stride = ANEutils->getInt32(src, "stride");
    dst.instanceDivisor = ANEutils->getInt32(src, "instanceDivisor");
}

static void Convert(LLGL::BufferDescriptor& dst, FREObject src)
{
    FREObject VertexAttribs = ANEutils->getObject(src, "vertexAttribs");
    uint32_t length;
    FREGetArrayLength(VertexAttribs, &length);
    ///
    std::vector<LLGL::VertexAttribute> nativeVertexAttribs;
    nativeVertexAttribs.resize(length);
    //
    for (int i = 0; i < (int)length; ++i) {
        FREObject vertexAttrib = ANEutils->getArrayIndex(VertexAttribs, i);
        Convert(nativeVertexAttribs[i], vertexAttrib);
    }
    ///
    dst.size = ANEutils->getInt32(src,"size");
    dst.stride = ANEutils->getInt32(src, "stride");
    dst.format = static_cast<LLGL::Format>(ANEutils->getInt32(src, "format"));
    dst.bindFlags = static_cast<long>(ANEutils->getInt32(src, "bindFlags"));
    dst.cpuAccessFlags = static_cast<long>(ANEutils->getInt32(src, "cpuAccessFlags"));
    dst.miscFlags = static_cast<long>(ANEutils->getInt32(src, "miscFlags"));
    dst.vertexAttribs = nativeVertexAttribs;
}


static void Convert(LLGL::ShaderDescriptor& dst, FREObject src)
{
    dst.type = (LLGL::ShaderType)ANEutils->getInt32(src, "type");
    dst.source = ANEutils->getString(src, "source").c_str();
    dst.sourceSize = ANEutils->getInt32(src, "sourceSize");
    dst.sourceType = (LLGL::ShaderSourceType)ANEutils->getInt32(src, "sourceType");
    dst.flags = (long)ANEutils->getUInt32(src, "flags");

    std::string entryPoint = ANEutils->getString(src, "entryPoint");
    if (entryPoint.length()) {
        dst.entryPoint = entryPoint.c_str();
    }
    std::string profile = ANEutils->getString(src, "profile");
    if (profile.length()) {
        dst.profile = profile.c_str();
    }

    ///
    FREObject inputAttribs = ANEutils->getObject(ANEutils->getObject(src, "vertex"),"inputAttribs");
    uint32_t length;
    FREGetArrayLength(inputAttribs, &length);
    if (length) {
        std::vector<LLGL::VertexAttribute> Attribs;
        Attribs.resize(length);
        for (int i = 0; i < (int)length; ++i) {
            FREObject vertexAttrib = ANEutils->getArrayIndex(inputAttribs, i);
            Convert(Attribs[i], vertexAttrib);
        }
        dst.vertex.inputAttribs = Attribs;
    }
}


static void Convert(LLGL::GraphicsPipelineDescriptor& dst, FREObject src)
{
    FREObject vertexShader = ANEutils->getObject(src, "vertexShader");
    FREObject fragmentShader = ANEutils->getObject(src, "fragmentShader");
    
    FREObjectType type;
    FREGetObjectType(vertexShader, &type);
    if (FRE_TYPE_NULL != type) {
        dst.vertexShader = reinterpret_cast<LLGL::Shader*>((uintptr_t)ANEutils->getDouble(vertexShader, "ShaderPtr"));
    }
    FREGetObjectType(fragmentShader, &type);
    if (FRE_TYPE_NULL != type) {
        dst.fragmentShader = reinterpret_cast<LLGL::Shader*>((uintptr_t)ANEutils->getDouble(fragmentShader, "ShaderPtr"));
    }
}