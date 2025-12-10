using my.bookshop as my from '../db/Books';

service CatalogService {
  entity Books as projection on my.Books;
}