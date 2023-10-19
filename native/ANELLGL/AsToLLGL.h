#pragma once


#include "ANEUtils.h"

static ANEUtils* ANEutils = new ANEUtils();


struct AIRVector {
    float vector2[];
};

static std::vector<AIRVector> ConvertArray(FREObject src)
{
    uint32_t length;
    FREGetArrayLength(src, &length);

    std::vector<AIRVector> cVector(length);


    for (int i = 0; i < length; ++i) {
        FREObject item = ANEutils->getArrayIndex(src, i);
        FREObjectType type;
        FREGetObjectType(item, &type);

        std::cout << "\nobjectType=" << type  << "      index="<<i << std::endl;
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
    for (int i = 0; i < length; ++i) {
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