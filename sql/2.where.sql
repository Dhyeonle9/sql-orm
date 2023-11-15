-- SELECT * FROM movies_user

-- User.objects.filter(age=41)
-- SELECT * FROM movies_user
-- WHERE age=30;

-- -- Movie.objects.filter(year__gt=2000) 장고에서는 부등호 사용불가
-- SELECT * FROM movies_movie
-- WHERE year > 2000;

-- -- 두가지 조건 동시에 AND
-- -- Movie.objects.filter(year__gt=2000, year__lt=2010) 연결해서 작성 greaterthan , lessthan
-- SELECT * FROM movies_movie
-- WHERE year > 2000 AND year < 2010;

-- 둘중에 하나 OR
-- Movie.objects.filter(Q(year__lt=2000) | Q(year__gt=2010))
-- -- Q 클래스로 감싸줘야함
-- SELECT * FROM movies_movie
-- WHERE year < 2000 OR year > 2010;

-- 부정 NOT
-- User.objects.exclude(age__gt=30) exclude 이용
-- SELECT * FROM movies_user
-- WHERE NOT age > 30;

-- MIN, MAX
-- Movie.objects.aggregate(Min('year'))
-- SELECT MIN(year) FROM movies_movie;

-- -- Movie.objects.aggregate(Max('year'))
-- SELECT MAX(year) FROM movies_movie;

-- 1번 영화에 평점이 가장높은값, 가장 낮은 값을 가져오기
-- SELECT 기준값
-- Score.objects.filter(movie_id=1).aggregate(Min('value'), Max('value'))
-- SELECT MAX(value), MIN(value) FROM movies_score
-- WHERE movie_id=1;


-- Count 갯수 출력
-- Movie.objects.count()
-- SELECT COUNT(*) FROM movies_movie;

-- 조건에 맞는 데이터 갯수 출력
-- Movie.objects.filter(year__gt=2000).count()
-- SELECT COUNT(*) FROM movies_movie
-- WHERE year > 2000;

-- distinct 이용하여 중복 제거하고 고유값만 출력
-- User.objects.values('country') 원하는 컬럼을 가져오기 values() 이용
-- User.objects.values('country').distinct().count()
-- SELECT COUNT(DISTINCT country) FROM movies_user;


-- Sum
-- User.objects.aggregate(Sum('age'))
-- SELECT SUM(age) FROM movies_user;

-- 10번 영화에 달린 평점의 합 구하기
-- Score.objects.filter(movie_id=10).aggregate(Sum('value'))
-- SELECT SUM(value) FROM movies_score
-- WHERE movie_id=10;


-- AVG
-- 영화들의 평균 개봉연도
-- Movie.objects.aggregate(Avg('year'))
-- SELECT AVG(year) FROM movies_movie;

-- 10번 영화의 평균평점
-- Score.objects.filter(movie_id=10).aggregate(Avg('value'))
-- SELECT AVG(value) FROM movies_score
-- WHERE movie_id=10;


-- LIKE (문자열 일치/포함 정보) 
--      %: 문자열이 없거나 한개, 여러개 가지는 경우 (*)
--      _: 한글자 (?)
-- ILIKE 는 대소문자도 구별 (장고는 icontains)


-- %이용

-- 중간에 the가 포함된 title 을 가진 영화 찾기
-- Movie.objects.filter(title__contains='the')
-- SELECT * FROM movies_movie
-- WHERE title LIKE '%the%';

-- the로 시작하는 title을 가진 영화 찾기
-- Movie.objects.filter(title__startswith='the')
-- SELECT * FROM movies_movie
-- WHERE title LIKE 'the%';

-- on.으로 끝나는 title을 가진 영화 찾기
-- Movie.objects.filter(title__endswith='on.')
-- SELECT * FROM movies_movie
-- WHERE title LIKE '%on.';


-- _ 이용

-- g__d가 포함된 title 가진 영화 찾기
-- ORM에서 사용하기 위해 정규표현식을 사용해야한다.(장고)
-- SELECT * FROM movies_movie
-- WHERE title LIKE '%g__d%';

-- Wildcards


-- in 
-- 포함되어있는 데이터 
-- Movie.objects.filter(year__in=[2000, 2001, 2002])
-- SELECT * FROM movies_movie
-- WHERE year IN (2000, 2001, 2002)


-- Between 
-- 사이에있는 데이터
-- User.objects.filter(age__range=[20, 29])
-- SELECT * FROM movies_user
-- WHERE age BETWEEN 20 AND 29;

-- -- User.objects.filter(age__range=[20, 29]).values('age')
-- SELECT age FROM movies_user
-- WHERE age BETWEEN 20 AND 29;