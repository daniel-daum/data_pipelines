SELECT
    charges.primary_key,
    charges.case_id,
    charges.prefix,
    charges.article,
    charges.article_suffix,
    charges.detail,
    inactive.case_status,
    inactive.rank_type,
    inactive.rank_abv,
    inactive.first_name,
    inactive.last_name,
    inactive.case_type,
    inactive.base_name,
    inactive.state,
    inactive.state_abv,
    inactive.trial_completion_date,
    inactive.verdict,
    inactive.sentence,
    inactive.forum,
    inactive.acquitted,
    inactive.confinement,
    inactive.discharge,
    inactive.forefeiture,
    inactive.labor,
    inactive.reduction,
    inactive.reprimand,
    inactive.restriction,
    inactive.no_trial_set,
    charges.updated_at
FROM
    {{ ref("usaf_charges") }} AS charges
    RIGHT JOIN {{ ref("usaf_cases_inactive") }} AS inactive
    ON charges.case_id = inactive.foreign_key
