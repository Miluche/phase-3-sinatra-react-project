import React, {useEffect, useState} from 'react';
import EmptyList from '../../components/common/EmptyList';
import BlogList from '../../components/Home/BlogList';
import Header from '../../components/Home/Header';
import SearchBar from '../../components/Home/SearchBar';
import {blogList} from "../../config/data";
// import { blogList } from '../../config/data';

const Home = () => {
  const [blogs, setBlogs] = useState([]);
  const [searchKey, setSearchKey] = useState('');

  useEffect(() => {
    fetch("http://localhost:9292/")
        .then((r) => r.json())
        .then((blogs) => setBlogs(blogs));
  }, []);

  // Search submit
  const handleSearchBar = (e) => {
    e.preventDefault();
    handleSearchResults(searchKey);
  };

  // Search for blog using the three endpoints
  const handleSearchResults = (searchKey) => {
    if (!searchKey) {
      // If search key is empty, show all blogs
      fetch("http://localhost:9292/")
          .then((r) => r.json())
          .then((blogs) => setBlogs(blogs));
    } else {
      // Search for blogs by category, author name, or created date
      const categorySearchUrl = `http://localhost:9292/blogs/${searchKey}`;
      const authorSearchUrl = `http://localhost:9292/blogs/author/${searchKey}`;
      const dateSearchUrl = `http://localhost:9292/blogs/created_on/${searchKey}`;

      Promise.all([
        fetch(categorySearchUrl),
        fetch(authorSearchUrl),
        fetch(dateSearchUrl),
      ])
          .then((responses) =>
              Promise.all(
                  responses.map((response) => {
                    if (response.status === 200) {
                      return response.json();
                    }
                    return null;
                  })
              )
          )
          .then((blogs) => {
            // Combine blogs from all endpoints
            const filteredBlogs = blogs.flat().filter((blog) => blog !== null);
            setBlogs(filteredBlogs);
            // console.log(blogs.json());
          });
    }
  };



  // Clear search and show all blogs
  const handleClearSearch = () => {
    // setBlogs(blogs);
    fetch("http://localhost:9292/")
        .then((r) => r.json())
        .then((blogs)=>setBlogs(blogs));
    setSearchKey('');
  };

  return (
    <div>
      {/* Page Header */}
      <Header />

      {/* Search Bar */}
      <SearchBar
        value={searchKey}
        clearSearch={handleClearSearch}
        formSubmit={handleSearchBar}
        handleSearchKey={(e) => setSearchKey(e.target.value)}
      />

      {/* Blog List & Empty View */}
      {!blogs.length ? <EmptyList /> : <BlogList blogs={blogs} />}
    </div>
  );
};

export default Home;
