
-- drop table if exists customers

CREATE TABLE customers (
    client_id TEXT,
    name TEXT,
    age INTEGER,
    location_id INTEGER,
    joined_bank DATE,
    banking_contact TEXT,
    nationality TEXT,
    occupation TEXT,
    fee_structure TEXT,
    loyalty_classification TEXT,

    estimated_income NUMERIC(18,2),
    superannuation_savings NUMERIC(18,2),

    amount_of_credit_cards INTEGER,
    credit_card_balance NUMERIC(18,2),

    bank_loans NUMERIC(18,2),
    bank_deposits NUMERIC(18,2),
    checking_accounts NUMERIC(18,2),
    saving_accounts NUMERIC(18,2),
    foreign_currency_account NUMERIC(18,2),
    business_lending NUMERIC(18,2),

    properties_owned INTEGER,
    risk_weighting INTEGER,

    brid INTEGER,
    genderid INTEGER,
    iaid INTEGER
);

---sample data
SELECT * FROM customers


---- Investor Table
CREATE TABLE InvestorAdvisor(
	IAId INTEGER,
	Investment_Advisor TEXT
)

SELECT * FROM investoradvisor