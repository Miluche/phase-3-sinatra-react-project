import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router';
import { blogList } from '../../config/data';
import Chip from '../../components/common/Chip';
import EmptyList from '../../components/common/EmptyList';
import './styles.css';
import { Link } from 'react-router-dom';
import { useHistory } from 'react-router-dom';

const Blog = () => {

    const history = useHistory();
    const { id } = useParams();
  const [blog, setBlog] = useState(null);

    const [deletedId, setDeletedId] = useState(null);
    const [deleted, setDeleted] = useState(false);
    const isDeleted = blog && deleted && blog.id === deletedId;

  useEffect(() => {
    fetch(`http://localhost:9292/blogs/${id}`)
        .then((response) => {
          if (!response.ok) {
            throw new Error('Blog not found');
          }
          return response.json();
        })
        .then((data) => setBlog(data))
        .catch((error) => {
          console.error(error);
          setBlog(null);
        });
      if (isDeleted) {
          setDeletedId(blog.id);
          setDeleted(true);
          history.push('/');
      }
  }, [isDeleted, blog, id, history]);


    function handleDelete(id) {
        fetch(`http://localhost:9292/blogs/${id}`, {
            method: 'DELETE',
        })
            .then(response => response.json())
            .then(data => {
                setDeletedId(id);
                setDeleted(true);
            })
            .catch(error => {
                console.error('Error deleting blog:', error);
            });
    }


    return !isDeleted && (
    <>
      <Link className='blog-goBack' to='/'>
        <span> &#8592;</span> <span>Go Back</span>
      </Link>
      {blog ? (
        <div className='blog-wrap'>
          <header>
            <p className='blog-date'>Published {blog.createdAt}</p>
            <h1>{blog.title}</h1>
            <div className='blog-subCategory'>
              {blog.subCategory.map((category, i) => (
                <div key={i}>
                  <Chip label={category} />
                </div>
              ))}
            </div>
              <button onClick={()=>handleDelete(blog.id)} className="blogItem-delete">Delete</button>
          </header>
          <img src={blog.cover} alt='cover' />
          <p className='blog-desc'>{blog.description}</p>
        </div>
      ) : (
        <EmptyList />
      )}
    </>
  );
};


export default Blog;
