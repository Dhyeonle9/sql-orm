-- Movie.objects.all()
-- SELECT * FROM movies_movie;

-- User.objects.all()
-- SELECT * FROM movies_user;

-- 데이터 정렬하여 가져오기 order_by() 기본적으로 오름차순
-- ORDER BY year DESC; 내림차순정렬 ASC; 오름차순(기본값)
SELECT * FROM movies_movie
ORDER BY year DESC;