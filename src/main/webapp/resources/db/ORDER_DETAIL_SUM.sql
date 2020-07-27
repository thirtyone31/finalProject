create or replace TRIGGER ORDER_DETAIL_SUM
AFTER
UPDATE OR INSERT ON ORDER_TB
FOR EACH ROW
    DECLARE
        -- 변수를 선언할 때는 DECLARE문을 사용해야 한다 
        TOTAL_PRICE NUMBER;
        PRAGMA AUTONOMOUS_TRANSACTION;
        INPUT_ID VARCHAR2(50);
    BEGIN
        IF  :NEW.STATUS_NUM = 2 THEN
            INPUT_ID := :OLD.MEMBER_ID;
            TOTAL_PRICE := SUMMARY_AMOUNT(INPUT_ID);

            UPDATE  MEMBER
            SET     GRADE_NUM = (SELECT MAX(GRADE_NUM) KEEP(DENSE_RANK LAST ORDER BY GRADE_STD_PRICE)
                                 FROM GRADE 
                                 WHERE GRADE_STD_PRICE <= TOTAL_PRICE)
            WHERE   MEMBER_ID = INPUT_ID;
            COMMIT;
        END IF;
    END; 