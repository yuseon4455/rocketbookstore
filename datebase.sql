-- Users (사용자 테이블)
drop table users;
CREATE TABLE users (
    user_id VARCHAR2(50) PRIMARY KEY,
    user_name VARCHAR2(100) NOT NULL,
    user_pw VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone VARCHAR2(50) UNIQUE
);
INSERT INTO users (user_id, user_name, user_pw, email, phone)
VALUES ('admin', '관리자', '1234', 'admin@gmail.com', '01012345678');
INSERT INTO users (user_id, user_name, user_pw, email, phone)
VALUES ('hong', '홍길동', 'pw1234', 'hong@gmail.com', '01012340000');
INSERT INTO users (user_id, user_name, user_pw, email, phone)
VALUES ('U002', '김철수', 'securepass', 'kim@gmail.com', '01098765432');
INSERT INTO users (user_id, user_name, user_pw, email, phone)
VALUES ('U003', '이영희', 'mypassword', 'lee@gmail.com', '01056781234');
commit;

-- Categories (카테고리 테이블)
drop table categories;
CREATE TABLE categories (
    category_id Number GENERATED ALWAYS as identity primary key,
    name VARCHAR2(100) NOT NULL
);
INSERT INTO categories (name) VALUES ('소설');
INSERT INTO categories (name) VALUES ('경제');
INSERT INTO categories (name) VALUES ('만화');
INSERT INTO categories (name) VALUES ('IT/프로그래밍');
INSERT INTO categories (name) VALUES ('인문');

-- Books (도서 테이블)
-- Books (도서 테이블)

select * from books;
-- cart
drop table cart;
CREATE TABLE cart (
    cart_id Number GENERATED ALWAYS as identity PRIMARY KEY,
    user_id VARCHAR2(200),
    book_id Number,
    amount Number NOT NULL
);
INSERT INTO cart (user_id, book_id, amount) VALUES ('hong', 1001, 2);
INSERT INTO cart (user_id, book_id, amount) VALUES ('U002', 1003, 1);
INSERT INTO cart (user_id, book_id, amount) VALUES ('U003', 1002, 5);

INSERT INTO cart (user_id, book_id, amount) VALUES ('hong', 1002, 2);
-- Wishlist (찜 목록 테이블)
-- Wishlist (찜 목록 테이블)
drop table wishlist;
CREATE TABLE wishlist (
    wishlist_id DECIMAL GENERATED ALWAYS as identity primary key,
    user_id VARCHAR2(200),
    book_id Number
);
INSERT INTO wishlist (user_id, book_id) VALUES (1, 1002);
INSERT INTO wishlist (user_id, book_id) VALUES (2, 1003);
INSERT INTO wishlist (user_id, book_id) VALUES (3, 1001);



-- Order (주문 테이블)
drop table orders;
CREATE TABLE orders (
    order_id VARCHAR2(50) PRIMARY KEY,
    ship_id Number,
    user_id VARCHAR2(100),
    order_date timestamp default current_timestamp,
    history_id VARCHAR2(50)
);

drop table orders_detail;
CREATE TABLE orders_detail (
    detail_id NUMBER GENERATED ALWAYS as identity PRIMARY KEY,
    order_id VARCHAR2(50),
    book_id NUMBER,
    amount NUMBER NOT NULL -- out_stock
);


-- Order Items (주문 상세 테이블) 삭제
drop table order_items;


-- Ship (배송 정보 테이블)
drop table ship;
CREATE TABLE ship (
    ship_id Number GENERATED ALWAYS as identity primary key,
    user_id VARCHAR2(50),
    address VARCHAR2(200) NOT NULL
);
INSERT INTO ship (user_id, address)
VALUES ('hong', '서울시 강남구 테헤란로 123');
INSERT INTO ship (user_id, address)
VALUES ('U002', '부산시 해운대구 센텀로 456');

-- shipping_history (배송상태)
drop table shipping_history;
CREATE TABLE shipping_history (
    history_id VARCHAR2(50) PRIMARY KEY,
    ship_state VARCHAR2(255) NOT NULL
);
select * from wishlist;

-- Stock Logs (재고 변경 로그)
drop table stock_logs;
CREATE TABLE stock_logs (
    log_id Number GENERATED ALWAYS AS IDENTITY
        start with 1 INCREMENT by 1
        PRIMARY key,
    book_id Number,
    in_stock Number DEFAULT 0
);
INSERT INTO stock_logs (book_id, in_stock) VALUES (1001, 5);
INSERT INTO stock_logs (book_id, in_stock) VALUES (1002, 10);
INSERT INTO stock_logs (book_id, in_stock) VALUES (1003, 7);

commit;
purge recyclebin;


select * from users;
select * from categories;
select * from books;
select * from wishlist;
select * from cart;
select * from orders;
select * from orders_detail;
select * from ship;
select * from shipping_history;
select * from stock_logs;

select cart_id, books.book_id, title, amount, price from cart, books 
where cart.book_id = books.book_id and cart.user_id='hong';

select o.order_id, o.order_date, o.user_id, o.ship_id, o.history_id, 
od.book_id, od.amount from orders o, orders_detail od 
where o.order_id=od.order_id and o.order_id='20250328000321';



drop table books;
CREATE TABLE books (
    book_id NUMBER GENERATED ALWAYS AS IDENTITY
        START WITH 1001 INCREMENT BY 1 PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    author VARCHAR2(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock NUMBER NOT NULL,
    category_id NUMBER,
    detail VARCHAR2(4000),
    image VARCHAR2(500) -- 이미지 경로를 저장할 컬럼 추가
);
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('UNLOCK AI 언락 AI', '조용민', 16200, 50, 2, 'AI 리터러시가 나의 잠재력이 되는 세상이 왔다', '/00img/economy/economy1.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('생각이 많은 당신을 위한 말하기 수업', '사이토 다카시, 최지현(옮김)', 16200, 50, 2, '고민을 줄이고 대화가 쉬워지는 방법', '/00img/economy/economy2.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('한 권으로 끝내는 회계와 재무제표', '신방수', 19800, 50, 2, '초보자도 이해하기 쉬운 회계 입문서', '/00img/economy/economy3.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('인생에 달리기가 필요한 시간', '권은주', 16020, 50, 2, '대한민국 신기록을 세운 마라톤 선수가 전하는 삶의 지혜', '/00img/economy/economy4.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('몸 좀 쓰면 어때', '이창현(열혈남아)', 15300, 50, 2, '책을 덮고 직접 몸을 움직여 실천하는 습관', '/00img/economy/economy5.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('혼자 시간으로 더 깊어지는 법에 관하여', '나르가 바클러, 최유정(옮김)', 16020, 50, 2, '혼자의 시간으로 더 나아지는 방법을 탐구하다', '/00img/economy/economy6.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('투자의 기술', '리 프리먼 샤프, 홍후주(옮김)', 18000, 50, 2, '투자에서 성공하기 위한 전략과 실행법', '/00img/economy/economy7.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('진심이 길을 만든다', '원정아', 16200, 50, 2, '오지랖이 만든 브랜드의 기적', '/00img/economy/economy8.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('엔비디아 세계 최강 반도체 기업이 만드는 2040 AI 세계', '초다 겐지, 한선주(옮김)', 16200, 50, 2, '세계 최고 반도체 기업의 미래 전략', '/00img/economy/economy9.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('최고의 공부법', '야스와카 코스케, 김대한(옮김)', 16200, 50, 2, '최단 시간 최대 효율을 끌어내는 학습 전략', '/00img/economy/economy10.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('AI 시대의 플랫폼 비즈니스', '김기준', 17820, 50, 2, '플랫폼 비즈니스에서 성공하는 법', '/00img/economy/economy11.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('나는 그곳에 있다 : I AM THAT I', '네빌 고다드, 홍주연(옮김)', 16200, 50, 2, '바라는 것이 아니라 존재하라', '/00img/economy/economy12.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('모든 게 처음인 브랜드의 무기들', '윤진주', 17100, 50, 2, '브랜드 성공을 위한 실전 전략', '/00img/economy/economy13.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('커서 AI', '서승완', 22500, 50, 2, '트렌드와 활용법을 한눈에', '/00img/economy/economy14.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('경영 승계 최고의 수업', '이대범', 18900, 50, 2, '소중한 회사를 후대에 전하는 방법', '/00img/economy/economy15.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('N잡러를 위한 거의 모든 절세', '권재희', 18000, 50, 2, '사업자를 위한 절세 방법 총정리', '/00img/economy/economy16.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('단 3개의 미국 ETF로 은퇴하라', '김지훈(포메뽀끄)', 17820, 50, 2, '안정적인 수익을 위한 ETF 투자 전략', '/00img/economy/economy17.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('내 주식에 일어날 수 있는 모든 일', '선진호', 16200, 50, 2, '주식 투자 시 발생할 수 있는 다양한 상황 분석', '/00img/economy/economy18.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('AI 시대, 우리의 질문', '미겔 앙헬 슈타이너거, 강민경(옮김)', 22500, 50, 2, 'AI가 불러올 미래 변화에 대한 철학적 고찰', '/00img/economy/economy19.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('세스 고딘의 전략 수업', '세스 고딘', 20700, 50, 2, '비즈니스 성공을 위한 전략적 사고', '/00img/economy/economy20.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('지리로 다시 읽는 자본주의 세계사', '이동민', 17550, 50, 2, '자본주의 발전을 지리적 관점에서 해석', '/00img/economy/economy21.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('업무시간을 반으로 줄이는 챗GPT 글쓰기', '정대현', 16200, 50, 2, '효율적인 글쓰기 기술로 생산성을 높이는 방법', '/00img/economy/economy22.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('바람을 보는 투자', '피터 오레일리, 김재청(옮김)', 17550, 50, 2, '거시적 시각에서 투자 기회를 찾는 법', '/00img/economy/economy23.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('애프터 넷플릭스', '조얼왈시', 19800, 50, 2, '미디어 산업의 변화와 넷플릭스 이후의 미래', '/00img/economy/economy24.jpg');


INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('된다! 조회수 터지는 유튜브 쇼츠 만들기', '최지영', 19800, 50, 4, '유튜브 쇼츠 제작 및 운영 노하우', '/00img/IT/IT1.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('챗GPT 리터러시 직장인 업무 만능 공략집', '이승환', 21600, 45, 4, '직장에서 ChatGPT를 활용하는 다양한 전략', '/00img/IT/IT2.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('코딩 자율학습 잔재미코딩의 파이썬 데이터 분석', '데이터 킴', 23400, 40, 4, '파이썬을 활용한 데이터 분석 및 머신러닝 입문서', '/00img/IT/IT3.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('프리미어 프로 & 애프터 이펙트 CC 2025', '심수현', 24300, 35, 4, '영상 편집을 위한 프리미어 프로 및 애프터 이펙트 가이드', '/00img/IT/IT4.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('혼자 공부하는 머신러닝 + 딥러닝', '박해선', 28800, 38, 4, '머신러닝과 딥러닝 기초부터 실전 적용까지', '/00img/IT/IT5.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('선생님을 위한 8282 업무 자동화 with AI + 파이썬 + 코드', '포병익', 25200, 30, 4, '교사를 위한 업무 자동화 방법', '/00img/IT/IT6.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('협업 기획자 마이즈가 알려주는 게임 시나리오 스쿨', '김현석', 23400, 28, 4, '게임 기획과 시나리오 작성 방법', '/00img/IT/IT7.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('실전! RAG 기반 생성형 AI 개발', '데니스 로슨 외', 28800, 25, 4, 'RAG 기반 AI 기술을 활용한 응용 개발', '/00img/IT/IT8.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('우아한 C 언어 코딩 패턴', '크리스틴 코르스', 28800, 20, 4, 'C 언어 기반의 효율적인 프로그래밍 패턴', '/00img/IT/IT9.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('포토샵 + 일러스트레이터 CC 2025', '민지영', 23400, 35, 4, '포토샵과 일러스트레이터 활용법', '/00img/IT/IT10.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('카프카 커넥트', '미카엘 호프만', 29700, 18, 4, 'Kafka Connect의 개념과 실전 활용', '/00img/IT/IT11.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('챗데리 따라하면 바로 되는 AI 마케팅 자동화', '챗데리(한주영)', 21600, 33, 4, 'AI를 활용한 마케팅 자동화 방법', '/00img/IT/IT12.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('레트로의 유니티 6 게임 프로그래밍 에센스', '이재민', 59400, 15, 4, '유니티 6을 활용한 게임 프로그래밍 기초', '/00img/IT/IT13.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('2025 최신판 윙크패스 ISMS-P 인증심사원 자격검정 실전모의고사', '김창용 외', 36000, 22, 4, 'ISMS-P 인증심사원 시험 대비 모의고사', '/00img/IT/IT14.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('엑셀 x 파이썬', '정상엽', 22500, 30, 4, '엑셀과 파이썬을 활용한 데이터 분석', '/00img/IT/IT15.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('디자인, 이것만 알면 쉬워져요 with 637가지 LESSON', '오네누마 아키', 18000, 35, 4, '기본 디자인 개념과 실전 응용', '/00img/IT/IT16.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('만들면서 배우는 워드프레스', '박광호', 26100, 30, 4, '워드프레스를 활용한 웹사이트 제작', '/00img/IT/IT17.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('그렇게 쓰면 아무도 안 읽습니다', '전주경', 17820, 33, 4, '잘 읽히는 글쓰기 노하우', '/00img/IT/IT18.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('랭체인으로 LLM 기반의 AI 서비스 개발하기', '서지영', 24300, 28, 4, 'LLM을 활용한 챗봇 및 AI 서비스 개발', '/00img/IT/IT19.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('생성형 AI 영상 제작: 영화, 애니메이션, 광고, PPT, 유튜브', '김세원', 21600, 32, 4, '생성형 AI를 활용한 영상 제작 기술', '/00img/IT/IT20.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('생성형 AI 극작 + 작사 마스터', '구오진', 18000, 30, 4, '생성형 AI를 활용한 스토리텔링 및 작사', '/00img/IT/IT21.jpg');


INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('망그러진 만화 3', '유랑', 16200, 50, 3, '망그러진 캐릭터들의 코믹한 이야기', '/00img/comic/comic1.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('와카코와 술 23', '신큐 치에', 7200, 50, 3, '한 잔의 술과 음식이 주는 작은 행복', '/00img/comic/comic2.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('행복은 먹고 자고 기다리고 5', '모도나리 토리', 7200, 50, 3, '소소한 행복을 그린 힐링 만화', '/00img/comic/comic3.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('마루는 강쥐 4', '모조', 14400, 50, 3, '마루와 강쥐의 따뜻한 이야기', '/00img/comic/comic4.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('마루는 강쥐 2', '모조', 14400, 50, 3, '마루와 강쥐의 따뜻한 이야기', '/00img/comic/comic5.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('극한견주 1', '마일로', 12600, 50, 3, '강아지와 함께하는 극한 일상', '/00img/comic/comic6.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('마루는 강쥐 3', '모조', 14400, 50, 3, '마루와 강쥐의 따뜻한 이야기', '/00img/comic/comic7.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('오무라이스 잼잼 15 (스페셜 리커버 양장본)', '조경규', 20700, 50, 3, '스페셜 에디션 오무라이스 잼잼', '/00img/comic/comic8.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('오무라이스 잼잼 15', '조경규', 18900, 50, 3, '다양한 음식과 추억이 담긴 이야기', '/00img/comic/comic9.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('꼬마곰의 케이크 가게 1', '카멘토츠', 9000, 50, 3, '따뜻한 감성이 담긴 케이크 가게 이야기', '/00img/comic/comic10.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('꿈빛 파티시엘 신장판 3', '마츠모토 나츠미', 5400, 50, 3, '달콤한 케이크와 우정 이야기', '/00img/comic/comic11.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('오래 보고 싶었다', '나태주', 15300, 50, 3, '내일 더 빛날 당신을 위한 위로', '/00img/comic/comic12.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('Artiste 아르티스트 10', '사모다 테타', 5850, 50, 3, '요리사의 성장과 예술적인 삶', '/00img/comic/comic13.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('너무나 귀여운 사람아! 1', '와타노 마이코', 5400, 50, 3, '조카와 삼촌, 두 사람이 그리는 따뜻한 이야기', '/00img/comic/comic14.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('중증외상센터 : 골든아워 2', '홍비치라', 13500, 50, 3, '병원 경영진과 중증외상 팀, 갈등의 시작!', '/00img/comic/comic15.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('하루 요리', '도토리대장', 14400, 50, 3, '쉽고 간단한 요리 레시피', '/00img/comic/comic16.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('코알라 그림일기', '유아미', 9900, 50, 3, '귀엽고, 힐링되고, 그리고 왠지 눈물이 나는 코알라의 일상', '/00img/comic/comic17.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('마루는 강쥐 6', '모조', 14400, 50, 3, '마루와 강쥐의 따뜻한 이야기', '/00img/comic/comic18.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('고양이와 할아버지 10', '네코마키', 9000, 50, 3, '할아버지와 고양이의 따뜻한 일상', '/00img/comic/comic19.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('고독한 미식가 2', '구스미 마사유키', 10800, 50, 3, '혼자서 맛집을 탐방하는 미식 만화', '/00img/comic/comic20.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('삼색 고양이 모부는 캔 부자가 되고 싶어', '쿠로야마 캐시 램', 10620, 50, 3, '고양이가 캔 부자가 되는 과정', '/00img/comic/comic21.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('뽀짜툰 10', '채유리', 15120, 50, 3, '고양이들의 귀여운 일상', '/00img/comic/comic22.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('형님 너구리', '이치젠 호노', 5850, 50, 3, '너구리 형제의 유쾌한 이야기', '/00img/comic/comic23.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('심야식당 29', '아베 야로', 8550, 50, 3, '신비한 식당으로 스트레스에 지친 모든 사람에게 한 알의 피로회복제', '/00img/comic/comic24.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('줄무늬 고양이 코우메 25', '호시노 나츠미', 4050, 50, 3, '고양이 코우메의 사랑스러운 이야기', '/00img/comic/comic25.jpg');


INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('혼모노', '성해나', 16200, 50, 1, '진짜와 가짜 사이, 인간 관계의 경계를 탐구하다.', '/00img/novel/novel1.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('봄밤의 모든 것', '백수린', 15300, 50, 1, '봄밤의 공기 속에서 피어나는 사랑과 기억.', '/00img/novel/novel2.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('숨겨진 전 죽음', '앤서니 호로비츠', 15120, 50, 1, '완벽한 사건 뒤에 숨겨진 또 다른 살인의 단서.', '/00img/novel/novel3.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('소년이 온다', '한강', 13500, 50, 1, '광주의 아픔을 살아낸 한 소년의 이야기.', '/00img/novel/novel4.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('언젠가 모든 것은 바다로 떨어진다', '세라 핀스커', 18000, 50, 1, '바다처럼 깊고 거대한 비밀이 감춰진 미스터리.', '/00img/novel/novel5.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('봄철 한정 딸기 타르트 사건', '요네자와 호노부', 14220, 50, 1, '딸기 타르트처럼 달콤하지만 위험한 사건.', '/00img/novel/novel6.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('작별하지 않는다', '한강', 15120, 50, 1, '인간의 폭력과 용서, 그리고 기억에 대한 서사.', '/00img/novel/novel7.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('용의자 X의 헌신', '히가시노 게이고', 16920, 50, 1, '완벽한 알리바이, 그러나 진실은 다른 곳에.', '/00img/novel/novel8.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('윌리엄', '메이슨 코일', 12600, 50, 1, 'AI가 안길 수 있는 최대한의 공포와 딜레마.', '/00img/novel/novel9.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('이상한 집', '우케쓰', 13500, 50, 1, '문을 열면 절대 돌아올 수 없는 공포의 저택.', '/00img/novel/novel10.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('수상한 살인', '김영민', 16200, 50, 1, '모두가 용의자인 한 사건의 진실을 파헤치다.', '/00img/novel/novel11.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('활자 잔혹극', '루스 렌들', 15120, 50, 1, '문학 속에 숨겨진 잔혹한 비밀을 파헤치는 미스터리.', '/00img/novel/novel12.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('가연물', '요네자와 호노부', 15030, 50, 1, '한 사건을 둘러싼 미묘한 심리전과 치밀한 추리.', '/00img/novel/novel13.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('부러진 용골', '요네자와 호노부', 19800, 50, 1, '밀실 살인과 논리의 대결, 완벽한 추리 소설.', '/00img/novel/novel14.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('히든 픽처스', '제이슨 클락', 12600, 50, 1, '한 장의 그림 속에 숨겨진 소름 끼치는 진실.', '/00img/novel/novel15.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('당신이 누군가를 죽였다', '히가시노 게이고', 17820, 50, 1, '완벽한 범죄를 꿈꾸던 순간, 모든 것이 무너진다.', '/00img/novel/novel16.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('한밤중의 마리오네트', '치넨 미키토', 15750, 50, 1, '자신이 조종당하고 있음을 깨닫는 순간.', '/00img/novel/novel17.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('친애하는 개자식에게', '버지니아 데팡트', 17820, 50, 1, '사회에 던지는 도발적인 질문과 강렬한 서사.', '/00img/novel/novel18.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('2025 제16회 젊은작가상 수상작품집', '백온유 외 7명', 6930, 50, 1, '문학의 존재 가치를 실감하게 이끌어줄 일곱 편의 소설.', '/00img/novel/novel19.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('죽음을 걷는 여자', '메리 피트', 13950, 50, 1, '한 여자의 죽음을 둘러싼 충격적인 진실.', '/00img/novel/novel21.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('기억을 되살리는 남자', '데이비드 발다치', 16200, 50, 1, '잃어버린 기억 속에서 범죄의 실마리를 찾다.', '/00img/novel/novel20.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('채식주의자', '한강', 13500, 50, 1, '고기 한 점 먹지 않겠다는 선택이 불러온 파문.', '/00img/novel/novel22.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) 
VALUES ('어린 왕자', '앙투안 드 생텍쥐페리', 12000, 50, 1, '어린 왕자가 여러 행성을 여행하며 어른들의 세계를 비판하고 사랑과 우정의 의미를 찾아가는 이야기.', '/00img/novel/novel23.jpg');


INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('내면소통 명상수업', '김주환', 25200, 50, 5, '일룸루멘셀(주)', '/00img/human/human1.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('넥서스', '유발 하라리, 김영주', 25020, 50, 5, '김영사', '/00img/human/human2.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('초역 부처의 말', '코이케 류노스케, 박재현', 16200, 50, 5, '프레시안', '/00img/human/human3.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('마음의 기술', '안드레 클뢰닌, 병상 크리닉', 18900, 50, 5, '상상스퀘어', '/00img/human/human4.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('고독의 이야기들', '발터 벤야민, 파울 클레', 19800, 50, 5, '엘리', '/00img/human/human5.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('위버멘쉬', '프리드리히 니체, 이나미네', 16200, 50, 5, 'RISE(떠오름)', '/00img/human/human6.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('공간 인간', '유현준', 17550, 50, 5, '을유문화사', '/00img/human/human7.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('이어령의 말', '이어령', 19800, 50, 5, '세계사', '/00img/human/human8.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('힐 그레의 힘에 대하여', '황동빈', 17820, 50, 5, '우고', '/00img/human/human9.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('하루 한 장의 어려움을 위한 시', '유성호', 16200, 50, 5, '위즈덤하우스', '/00img/human/human10.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('자살의 연구', '앨 엠버레즈, 중승자', 18900, 50, 5, '세계사', '/00img/human/human11.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('나는 뻔뻔하게 살기로 했다', '데이비드 시버리, 김정한', 19800, 50, 5, '프레시안', '/00img/human/human12.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('다윈의 위험한 생각', '대니얼 C. 데닛, 신광복', 61750, 50, 5, '바다출판사', '/00img/human/human13.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('침묵의 서', '조제프 앙투안 투생 디누아르트, 성귀수', 17820, 50, 5, 'arte(아르테)', '/00img/human/human14.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('다정한 것이 살아남는다', '브라이언 헤어, 버네사 우즈', 19800, 50, 5, '디플롯', '/00img/human/human15.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('우울: 공적 감정', '앤 츠바이트로비치, 박미선', 23400, 50, 5, '마티', '/00img/human/human16.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('총 균 쇠', '제레드 다이아몬드, 강주현', 26820, 50, 5, '김영사', '/00img/human/human17.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('나를 지키는 민법', '장보윤', 16920, 50, 5, '생각의힘', '/00img/human/human18.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('내가 사랑하는 사람들이 이 책을 읽었으면', '필리파 페리, 방수진', 17100, 50, 5, '세계사', '/00img/human/human19.jpg');
INSERT INTO books (title, author, price, stock, category_id, detail, image) VALUES 
('나는 왜 남들보다 쉽게 지칠까', '최재훈', 16200, 50, 5, '선스토리', '/00img/human/human20.jpg');

select * from books;
commit;
