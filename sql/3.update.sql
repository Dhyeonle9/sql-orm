-- 업데이트
-- UPDATE
-- SET
-- WHERE


-- 영화배우 목록
-- SELECT * FROM movies_actor
-- WHERE id=1;
-- 1번 배우의 이름을 iron man으로 바꾸기
UPDATE movies_actor
SET name='iron man'
WHERE id=1;

-- actor=Actor.objects.get(id=1)
-- actor.age = 50
-- actor.save()

