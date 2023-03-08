import React from 'react';
import BlogItem from './BlogItem';
import './styles.css';
import {Link} from "react-router-dom";

const BlogList = ({ blogs }) => {
  return (
    <div className='blogList-wrap'>
      {blogs.map((blog) => (
          <Link key={blog.id} to={`/blogs/${blog.id}`} style={{ textDecoration: 'none' }}>
            <BlogItem blog={blog} />
          </Link>
      ))}
    </div>
  );
};

export default BlogList;
