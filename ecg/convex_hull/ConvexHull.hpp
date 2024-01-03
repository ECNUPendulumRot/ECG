
#ifndef ECG_CONVEXHULL_HPP
#define ECG_CONVEXHULL_HPP

#include <vector>
#include <array>

#include "base/types.hpp"


namespace ECG {

    class ConvexHull;

}


typedef std::array<double, 2> Point;

typedef std::array<u_index_t, 2> Edge;

class ECG::ConvexHull {

protected:

    // The vertexes of the origin vertexes
    const double* m_vertex;

    u_index_t m_vertex_count;

    // The result of the convex hull
    std::vector<Edge> m_hull;

public:

    void set_vertex(const double* vertex, unsigned int vertex_count);

    virtual void compute() = 0;

};


#endif //ECG_CONVEXHULL_HPP
