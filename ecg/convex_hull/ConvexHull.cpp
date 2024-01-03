
#include "ConvexHull.hpp"


void ECG::ConvexHull::set_vertex(const double *vertex, unsigned int vertex_count)
{
    m_vertex = vertex;
    m_vertex_count = vertex_count;
}
