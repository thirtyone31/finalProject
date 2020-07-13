create or replace TRIGGER ORDER_DETAIL_SUM
AFTER
UPDATE OR INSERT ON ORDER_TB
FOR EACH ROW
    DECLARE
        -- ������ ������ ���� DECLARE���� ����ؾ� �Ѵ� 
        TOTAL_PRICE NUMBER;
    BEGIN
        IF  :NEW.STATUS_NUM = 2 THEN
            SELECT  NVL(SUM(A.PRODUCT_QTY * A.PRODUCT_PRICE),0) INTO TOTAL_PRICE
            FROM    ORDER_DETAIL A
            WHERE   :NEW.CDT BETWEEN ADD_MONTHS(SYSDATE, -3) AND SYSDATE
            AND     A.ORDER_NUM = :OLD.ORDER_NUM;

            UPDATE  MEMBER
            SET     GRADE_NUM = (SELECT MAX(GRADE_NUM) KEEP(DENSE_RANK LAST ORDER BY GRADE_STD_PRICE)
                                 FROM GRADE 
                                 WHERE GRADE_STD_PRICE < TOTAL_PRICE);
        END IF;
    END; 
