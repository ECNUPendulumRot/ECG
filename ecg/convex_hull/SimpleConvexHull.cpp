
#include "SimpleConvexHull.hpp"


void ECG::SimpleConvexHull::compute()
{
    // traverse all ordered pairs of vertexes
    for (u_index_t i = 0; i < m_vertex_count; ++i) {
        for (u_index_t j = 0; j < m_vertex_count && j != i; ++j) {
            bool valid = true;

            double p_x = m_vertex[i * 2], p_y = m_vertex[i * 2 + 1];
            double q_x = m_vertex[j * 2], q_y = m_vertex[j * 2 + 1];

            for (u_index_t k = 0; k != i && k != j && k < m_vertex_count; ++k) {
                double r_x = m_vertex[k * 2], r_y = m_vertex[k * 2 + 1];
                // calculate the cross product of pr and pq
                double v_pr_x = r_x - p_x, v_pr_y = r_y - p_y;
                double v_pq_x = q_x - p_x, v_pq_y = q_y - p_y;

                if (v_pr_x * v_pq_y - v_pr_y * v_pq_x < 0) {
                    valid = false;
                    break;
                }
            }

            if (valid)
                m_hull.emplace_back(Edge{i, j});
        }
    }
}