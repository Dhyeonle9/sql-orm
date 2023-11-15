-- 1번 유저가 작성한 모든 점수(Score)

-- Score.objects.filter(user_id=1)
-- User.objects.get(id=1).score_set.all()

-- JOIN 표를 합쳐줌
-- ON 뒤에 기준점을 잡아줘야함
-- N:1 관계 테이블 연결

-- SELECT movies_score.id FROM movies_user
-- JOIN movies_score ON movies_user.id = movies_score.user_id
-- WHERE movies_user.id=1;


-- M:N관계 연결 (중간테이블이 생성되기때문에 3개의 테이블을 연결해야함)
-- JOIN table을 두번 연결
-- 1번 영화의 카테고리
-- Movie.objects.get(id=1).categories.all()

-- SELECT * FROM movies_movie
-- JOIN movies_category_movies ON movies_movie.id = movies_category_movies.movie_id
-- JOIN movies_category ON movies_category.id = movies_category_movies.category_id
-- WHERE movies_movie.id=1;

-- 1번 유저가 작성한 모든 점수의 평균
-- User.objects.get(id=1).score_set.all().aggregate(Avg('value'))

-- SELECT Avg(value) FROM movies_user
-- JOIN movies_score ON movies_user.id = movies_score.user_id
-- WHERE movies_user.id=1;

-- drama 카테고리에 속한 모든 영화
-- Category.objects.get(name='drama').movies.all()

-- SELECT * FROM movies_movie
-- JOIN movies_category_movies ON movies_movie.id = movies_category_movies.movie_id
-- JOIN movies_category ON movies_category.id = movies_category_movies.category_id
-- WHERE movies_category.name = 'drama';


-- group by 
-- 데이터를 특정한 컬럼(유일한)을 기준으로 묶을때 이용
-- -- User.objects.values('country').annotate(Count('id'))
-- SELECT country, COUNT(*) FROM movies_user
-- GROUP BY country;

-- 나라별 사람들의 평균 평점
-- User.objects.values('country').annotate(Count('id'), Avg('score__value'))

SELECT country, COUNT(*), AVG(value) FROM movies_user
JOIN movies_score ON movies_user.id = movies_score.user_id
GROUP BY country;