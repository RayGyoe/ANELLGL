#pragma once


#include "ANEUtils.h"

static ANEUtils* ANEutils = new ANEUtils();

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

static void Convert(LLGL::BufferDescriptor& dst, FREObject src, std::vector<LLGL::VertexAttribute>& nativeVertexAttribs)
{
    FREObject VertexAttribs = ANEutils->getObject(src, "vertexAttribs");
    uint32_t length;
    FREGetArrayLength(VertexAttribs, &length);
    nativeVertexAttribs.resize(length);
    for (int i = 0; i < length; ++i) {
        FREObject vertexAttrib = ANEutils->getArrayIndex(VertexAttribs, i);
        Convert(nativeVertexAttribs[i], vertexAttrib);
    }

    dst.size = ANEutils->getInt32(src,"size");
    dst.stride = ANEutils->getInt32(src, "stride");
    dst.format = static_cast<LLGL::Format>(ANEutils->getInt32(src, "format"));
    dst.bindFlags = static_cast<long>(ANEutils->getInt32(src, "bindFlags"));
    dst.cpuAccessFlags = static_cast<long>(ANEutils->getInt32(src, "cpuAccessFlags"));
    dst.miscFlags = static_cast<long>(ANEutils->getInt32(src, "miscFlags"));
    dst.vertexAttribs = nativeVertexAttribs;
}