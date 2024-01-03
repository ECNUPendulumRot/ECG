
#ifndef ECG_SIMPLECONVEXHULL_HPP
#define ECG_SIMPLECONVEXHULL_HPP

#include "base/types.hpp"
#include "ConvexHull.hpp"


namespace ECG {

    class SimpleConvexHull;

}

class ECG::SimpleConvexHull: public ConvexHull {

public:

    // calculate the convex hull of the vertexes
    // not that the vertex of the hull is in clockwise order
    void compute() override;

};


#endif //ECG_SIMPLECONVEXHULL_HPP
