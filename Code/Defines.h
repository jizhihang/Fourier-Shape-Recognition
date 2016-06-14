#ifndef __DEFINES_H
#define __DEFINES_H

#include <vector>

#define K			8

typedef unsigned char DescriptorUI8[128];
typedef double FrameF64[4];
typedef float DescriptorF32[128];

typedef struct
{
	char filename[20];
	int N;
	DescriptorUI8 *d;
	double *entropyValues;
	FrameF64 *frame;
} ImageData;

typedef struct
{
	DescriptorUI8 value;
	FrameF64 frame;
	double entropy;
} DescStruct;

typedef struct
{
	int imageId;	

	double nodeCount;
	double nodeCount2;
} ListElement;

typedef std::vector<ListElement> InvertedFile;

typedef struct _treeNode
{
	_treeNode *parent;
	std::vector<DescriptorUI8 *> descList;
	DescriptorF32 centres[K];
	double weight;
	int docCount;
	int lastDocId;
	InvertedFile invFile;
	_treeNode *children[K];
} TreeNode;

typedef std::vector<ImageData *> ImageList;

#endif