#pragma once

#define WIN32_LEAN_AND_MEAN

#include <windows.h>

#include <sstream>


#include <memory>
#include <stdio.h>
#include <assert.h>

#include <vector>
#include <sstream>
#include <fstream>
#include <iostream>
#include <set>
#include <vector>

#include <string>
#include <locale>
#include <codecvt>

#include "FlashRuntimeExtensions.h"


using std::string;
using namespace std;

typedef signed char			int8;
typedef signed short		int16;
typedef signed int			int32;
typedef signed long long	int64;
typedef unsigned char		uint8;
typedef unsigned short		uint16;
typedef unsigned int		uint32;
typedef unsigned long long	uint64;

#ifndef SafeDelete
#define SafeDelete(p) { delete (p); (p) = NULL; }
#endif //SafeDelete

#define SafeDeleteVideoArr(pArr) {delete[] pArr; pArr = 0;}






class ANEUtils {

public:

	FREObject AS_String(std::string value) {
		FREObject result;
		FRENewObjectFromUTF8(uint32_t(value.length()), reinterpret_cast<const uint8_t*>(value.data()), &result);
		return result;
	}
	FREObject AS_String(const char* value) {
		FREObject result;
		FRENewObjectFromUTF8(uint32_t(strlen(value)) + 1, reinterpret_cast<const uint8_t*>(value), &result);
		return result;
	}

	
	FREObject AS_int(int32_t value) {
		FREObject result;
		FRENewObjectFromInt32(value, &result);
		return result;
	}

	FREObject AS_uint(uint32_t value) {
		FREObject result;
		FRENewObjectFromUint32(value, &result);
		return result;
	}

	FREObject AS_uint(uint64_t value) {
		FREObject result;
		FRENewObjectFromUint32((uint32_t)value, &result);
		return result;
	}

	FREObject AS_uint(uint8_t value) {
		FREObject result;
		FRENewObjectFromUint32(value, &result);
		return result;
	}


	FREObject AS_Boolean(bool value) {
		FREObject result;
		FRENewObjectFromBool(value, &result);
		return result;
	}

	FREObject AS_Number(double value) {
		FREObject result;
		FRENewObjectFromDouble(value, &result);
		return result;
	}

	FREObject AS_Point(double x, double y) {
		FREObject obj;
		FREObject argv[] = {
			AS_Number(x),
			AS_Number(y)
		};
		FRENewObject(reinterpret_cast<const uint8_t*>("flash.geom.Point"), 2, argv, &obj, nullptr);
		return obj;
	}

	FREObject AS_ClassObject(std::string className) {
		FREObject result = NULL;
		FRENewObject((const uint8_t*)className.c_str(), 0, NULL, &result, NULL);
		return result;
	}



	FREObject getObject(FREObject target, std::string key) {
		FREObject value;
		FREGetObjectProperty(target, (const uint8_t*)key.c_str(), &value, NULL);
		return value;
	}

	FREObject getArrayIndex(FREObject target, int index) {
		FREObject value;
		FREGetArrayElementAt(target, index, &value);
		return value;
	}

	uint32_t getUInt32(FREObject freObject);
	uint32_t getUInt32(FREObject target, std::string key) {
		return getUInt32(getObject(target, key));
	}


	int32_t getInt32(FREObject freObject);
	int32_t getInt32(FREObject target, std::string key) {
		return getInt32(getObject(target,key));
	}

	std::string getString(FREObject freObject);
	std::string getString(FREObject target, std::string key) {
		return getString(getObject(target, key));
	}

	bool getBool(FREObject freObject);
	double getDouble(FREObject freObject);
	double getDouble(FREObject target, std::string key) {
		return getDouble(getObject(target, key));
	}

	std::string intToStdString(int value);
	std::string utf8_to_ansi(std::string strUTF8);
	const char* utf8_to_ansi(const char* strUTF8A);
	std::string UTF8ToANSI(std::string s);
	char* UTF8ToCharANSI(std::string s);
	std::string string_To_UTF8(const std::string& str);
	std::wstring to_wide_string(const std::string & input);
	std::string to_byte_string(const std::wstring & input);
	std::wstring s2ws(const std::string& str);
	wchar_t* chatToWchar(const char* ch);
	char* wcharToChar(const wchar_t* wch);

	FREContext ctxContext;
	void dispatchEvent(std::string name, std::string value);

	void trace(std::string message) const;	

	bool LoadBundle(std::string strRealPath, vector<char>& data);

	string UrlUTF8(char * str);

private:
	bool isFREResultOK(FREResult errorCode, std::string errorMessage);
	void GB2312ToUTF_8(string & pOut, char * pText, int pLen);
	void Gb2312ToUnicode(WCHAR * pOut, char * gbBuffer);
	void UnicodeToUTF_8(char * pOut, WCHAR * pText);
};




