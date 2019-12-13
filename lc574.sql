## LC 574
# MySQL

SELECT
    x.Name
FROM
    Candidate x,
     (
        select
            CandidateId as cid
        from
            Vote
        group by
            CandidateId
        order by
            count(*) desc
        limit 1
    ) y
where
    x.id = y.cid
