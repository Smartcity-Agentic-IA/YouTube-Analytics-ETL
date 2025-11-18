-- ================================
-- YOUTUBE ANALYTICS DATABASE INITIALIZATION
-- ================================

-- Enable extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- ================================
-- RAW TABLES (Bronze Layer)
-- ================================

-- Table pour les vidéos brutes
CREATE TABLE IF NOT EXISTS raw_videos (
    id BIGSERIAL PRIMARY KEY,
    video_id VARCHAR(50) UNIQUE NOT NULL,
    channel_id VARCHAR(50) NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    published_at TIMESTAMP NOT NULL,
    thumbnail_url TEXT,
    duration VARCHAR(20),
    view_count BIGINT DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    comment_count INTEGER DEFAULT 0,
    category_id INTEGER,
    tags TEXT[],
    language VARCHAR(10),
    caption_available BOOLEAN DEFAULT FALSE,
    license VARCHAR(50),
    privacy_status VARCHAR(20),
    raw_data JSONB,
    extracted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les chaînes brutes
CREATE TABLE IF NOT EXISTS raw_channels (
    id BIGSERIAL PRIMARY KEY,
    channel_id VARCHAR(50) UNIQUE NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    custom_url VARCHAR(255),
    published_at TIMESTAMP,
    thumbnail_url TEXT,
    country VARCHAR(2),
    view_count BIGINT DEFAULT 0,
    subscriber_count INTEGER DEFAULT 0,
    video_count INTEGER DEFAULT 0,
    topic_categories TEXT[],
    raw_data JSONB,
    extracted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les commentaires bruts
CREATE TABLE IF NOT EXISTS raw_comments (
    id BIGSERIAL PRIMARY KEY,
    comment_id VARCHAR(50) UNIQUE NOT NULL,
    video_id VARCHAR(50) NOT NULL,
    author_name VARCHAR(255),
    author_channel_id VARCHAR(50),
    text TEXT NOT NULL,
    like_count INTEGER DEFAULT 0,
    published_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    parent_id VARCHAR(50),
    raw_data JSONB,
    extracted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================
-- TRANSFORMED TABLES (Silver Layer)
-- ================================

-- Table des vidéos transformées avec métriques
CREATE TABLE IF NOT EXISTS transformed_videos (
    id BIGSERIAL PRIMARY KEY,
    video_id VARCHAR(50) UNIQUE NOT NULL,
    channel_id VARCHAR(50) NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    published_at TIMESTAMP NOT NULL,
    duration_seconds INTEGER,
    view_count BIGINT DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    comment_count INTEGER DEFAULT 0,
    category_id INTEGER,
    
    -- Métriques calculées
    engagement_rate DECIMAL(10, 4),
    like_rate DECIMAL(10, 4),
    comment_rate DECIMAL(10, 4),
    view_velocity DECIMAL(15, 4),
    viral_score DECIMAL(10, 4),
    
    -- Métadonnées
    tag_count INTEGER DEFAULT 0,
    title_length INTEGER,
    description_length INTEGER,
    has_thumbnail BOOLEAN DEFAULT FALSE,
    has_captions BOOLEAN DEFAULT FALSE,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des chaînes transformées
CREATE TABLE IF NOT EXISTS transformed_channels (
    id BIGSERIAL PRIMARY KEY,
    channel_id VARCHAR(50) UNIQUE NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    published_at TIMESTAMP,
    view_count BIGINT DEFAULT 0,
    subscriber_count INTEGER DEFAULT 0,
    video_count INTEGER DEFAULT 0,
    
    -- Métriques calculées
    avg_views_per_video DECIMAL(15, 2),
    subscriber_growth_rate DECIMAL(10, 4),
    engagement_score DECIMAL(10, 4),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des commentaires avec sentiment
CREATE TABLE IF NOT EXISTS transformed_comments (
    id BIGSERIAL PRIMARY KEY,
    comment_id VARCHAR(50) UNIQUE NOT NULL,
    video_id VARCHAR(50) NOT NULL,
    author_name VARCHAR(255),
    text TEXT NOT NULL,
    like_count INTEGER DEFAULT 0,
    published_at TIMESTAMP NOT NULL,
    
    -- Analyse de sentiment
    sentiment VARCHAR(20),
    sentiment_score DECIMAL(5, 4),
    positive_score DECIMAL(5, 4),
    negative_score DECIMAL(5, 4),
    neutral_score DECIMAL(5, 4),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- ================================
-- YOUTUBE ANALYTICS DATABASE INITIALIZATION
-- ================================

-- Enable extensions
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pg_trgm";

-- ================================
-- RAW TABLES (Bronze Layer)
-- ================================

-- Table pour les vidéos brutes
CREATE TABLE IF NOT EXISTS raw_videos (
    id BIGSERIAL PRIMARY KEY,
    video_id VARCHAR(50) UNIQUE NOT NULL,
    channel_id VARCHAR(50) NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    published_at TIMESTAMP NOT NULL,
    thumbnail_url TEXT,
    duration VARCHAR(20),
    view_count BIGINT DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    comment_count INTEGER DEFAULT 0,
    category_id INTEGER,
    tags TEXT[],
    language VARCHAR(10),
    caption_available BOOLEAN DEFAULT FALSE,
    license VARCHAR(50),
    privacy_status VARCHAR(20),
    raw_data JSONB,
    extracted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les chaînes brutes
CREATE TABLE IF NOT EXISTS raw_channels (
    id BIGSERIAL PRIMARY KEY,
    channel_id VARCHAR(50) UNIQUE NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    custom_url VARCHAR(255),
    published_at TIMESTAMP,
    thumbnail_url TEXT,
    country VARCHAR(2),
    view_count BIGINT DEFAULT 0,
    subscriber_count INTEGER DEFAULT 0,
    video_count INTEGER DEFAULT 0,
    topic_categories TEXT[],
    raw_data JSONB,
    extracted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table pour les commentaires bruts
CREATE TABLE IF NOT EXISTS raw_comments (
    id BIGSERIAL PRIMARY KEY,
    comment_id VARCHAR(50) UNIQUE NOT NULL,
    video_id VARCHAR(50) NOT NULL,
    author_name VARCHAR(255),
    author_channel_id VARCHAR(50),
    text TEXT NOT NULL,
    like_count INTEGER DEFAULT 0,
    published_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP,
    parent_id VARCHAR(50),
    raw_data JSONB,
    extracted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================
-- TRANSFORMED TABLES (Silver Layer)
-- ================================

-- Table des vidéos transformées avec métriques
CREATE TABLE IF NOT EXISTS transformed_videos (
    id BIGSERIAL PRIMARY KEY,
    video_id VARCHAR(50) UNIQUE NOT NULL,
    channel_id VARCHAR(50) NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    published_at TIMESTAMP NOT NULL,
    duration_seconds INTEGER,
    view_count BIGINT DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    comment_count INTEGER DEFAULT 0,
    category_id INTEGER,
    
    -- Métriques calculées
    engagement_rate DECIMAL(10, 4),
    like_rate DECIMAL(10, 4),
    comment_rate DECIMAL(10, 4),
    view_velocity DECIMAL(15, 4),
    viral_score DECIMAL(10, 4),
    
    -- Métadonnées
    tag_count INTEGER DEFAULT 0,
    title_length INTEGER,
    description_length INTEGER,
    has_thumbnail BOOLEAN DEFAULT FALSE,
    has_captions BOOLEAN DEFAULT FALSE,
    
    -- Timestamps
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des chaînes transformées
CREATE TABLE IF NOT EXISTS transformed_channels (
    id BIGSERIAL PRIMARY KEY,
    channel_id VARCHAR(50) UNIQUE NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    published_at TIMESTAMP,
    view_count BIGINT DEFAULT 0,
    subscriber_count INTEGER DEFAULT 0,
    video_count INTEGER DEFAULT 0,
    
    -- Métriques calculées
    avg_views_per_video DECIMAL(15, 2),
    subscriber_growth_rate DECIMAL(10, 4),
    engagement_score DECIMAL(10, 4),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des commentaires avec sentiment
CREATE TABLE IF NOT EXISTS transformed_comments (
    id BIGSERIAL PRIMARY KEY,
    comment_id VARCHAR(50) UNIQUE NOT NULL,
    video_id VARCHAR(50) NOT NULL,
    author_name VARCHAR(255),
    text TEXT NOT NULL,
    like_count INTEGER DEFAULT 0,
    published_at TIMESTAMP NOT NULL,
    
    -- Analyse de sentiment
    sentiment VARCHAR(20),
    sentiment_score DECIMAL(5, 4),
    positive_score DECIMAL(5, 4),
    negative_score DECIMAL(5, 4),
    neutral_score DECIMAL(5, 4),
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ================================
-- DIMENSION TABLES (Gold Layer - Star Schema)
-- ================================

-- Dimension Date
CREATE TABLE IF NOT EXISTS dim_date (
    date_key INTEGER PRIMARY KEY,
    full_date DATE NOT NULL UNIQUE,
    year INTEGER NOT NULL,
    quarter INTEGER NOT NULL,
    month INTEGER NOT NULL,
    week INTEGER NOT NULL,
    day INTEGER NOT NULL,
    day_of_week INTEGER NOT NULL,
    day_name VARCHAR(10) NOT NULL,
    month_name VARCHAR(10) NOT NULL,
    is_weekend BOOLEAN NOT NULL,
    is_holiday BOOLEAN DEFAULT FALSE
);

-- Dimension Channel
CREATE TABLE IF NOT EXISTS dim_channel (
    channel_key SERIAL PRIMARY KEY,
    channel_id VARCHAR(50) UNIQUE NOT NULL,
    channel_name VARCHAR(255) NOT NULL,
    custom_url VARCHAR(255),
    country VARCHAR(2),
    topic_categories TEXT[],
    effective_date TIMESTAMP NOT NULL,
    expiry_date TIMESTAMP,
    is_current BOOLEAN DEFAULT TRUE
);

-- Dimension Video Category
CREATE TABLE IF NOT EXISTS dim_category (
    category_key SERIAL PRIMARY KEY,
    category_id INTEGER UNIQUE NOT NULL,
    category_name VARCHAR(100) NOT NULL
);

-- ================================
-- FACT TABLES (Gold Layer)
-- ================================

-- Fact Video Statistics (daily snapshots)
CREATE TABLE IF NOT EXISTS fact_video_stats (
    id BIGSERIAL PRIMARY KEY,
    video_id VARCHAR(50) NOT NULL,
    channel_key INTEGER REFERENCES dim_channel(channel_key),
    category_key INTEGER REFERENCES dim_category(category_key),
    date_key INTEGER REFERENCES dim_date(date_key),
    
    -- Métriques
    view_count BIGINT DEFAULT 0,
    like_count INTEGER DEFAULT 0,
    comment_count INTEGER DEFAULT 0,
    engagement_rate DECIMAL(10, 4),
    view_velocity DECIMAL(15, 4),
    
    snapshot_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(video_id, snapshot_date)
);

-- Fact Daily Aggregations
CREATE TABLE IF NOT EXISTS fact_daily_metrics (
    id BIGSERIAL PRIMARY KEY,
    channel_key INTEGER REFERENCES dim_channel(channel_key),
    date_key INTEGER REFERENCES dim_date(date_key),
    
    -- Métriques agrégées
    total_videos INTEGER DEFAULT 0,
    total_views BIGINT DEFAULT 0,
    total_likes INTEGER DEFAULT 0,
    total_comments INTEGER DEFAULT 0,
    avg_engagement_rate DECIMAL(10, 4),
    new_videos INTEGER DEFAULT 0,
    
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    UNIQUE(channel_key, date_key)
);

-- ================================
-- INDEXES pour optimisation
-- ================================

-- Raw tables indexes
CREATE INDEX idx_raw_videos_channel ON raw_videos(channel_id);
CREATE INDEX idx_raw_videos_published ON raw_videos(published_at);
CREATE INDEX idx_raw_videos_extracted ON raw_videos(extracted_at);
CREATE INDEX idx_raw_comments_video ON raw_comments(video_id);
CREATE INDEX idx_raw_comments_published ON raw_comments(published_at);

-- Transformed tables indexes
CREATE INDEX idx_transformed_videos_channel ON transformed_videos(channel_id);
CREATE INDEX idx_transformed_videos_published ON transformed_videos(published_at);
CREATE INDEX idx_transformed_videos_engagement ON transformed_videos(engagement_rate DESC);
CREATE INDEX idx_transformed_comments_video ON transformed_comments(video_id);
CREATE INDEX idx_transformed_comments_sentiment ON transformed_comments(sentiment);

-- Fact tables indexes
CREATE INDEX idx_fact_video_stats_video ON fact_video_stats(video_id);
CREATE INDEX idx_fact_video_stats_channel ON fact_video_stats(channel_key);
CREATE INDEX idx_fact_video_stats_date ON fact_video_stats(date_key);
CREATE INDEX idx_fact_video_stats_snapshot ON fact_video_stats(snapshot_date);
CREATE INDEX idx_fact_daily_metrics_channel ON fact_daily_metrics(channel_key);
CREATE INDEX idx_fact_daily_metrics_date ON fact_daily_metrics(date_key);

-- ================================
-- VIEWS pour analytics
-- ================================

-- Vue pour les vidéos les plus performantes
CREATE OR REPLACE VIEW v_top_performing_videos AS
SELECT 
    tv.video_id,
    tv.title,
    dc.channel_name,
    tv.view_count,
    tv.like_count,
    tv.comment_count,
    tv.engagement_rate,
    tv.viral_score,
    tv.published_at
FROM transformed_videos tv
JOIN dim_channel dc ON tv.channel_id = dc.channel_id
WHERE dc.is_current = TRUE
ORDER BY tv.engagement_rate DESC
LIMIT 100;

-- Vue pour les tendances quotidiennes
CREATE OR REPLACE VIEW v_daily_trends AS
SELECT 
    dd.full_date,
    dd.day_name,
    COUNT(DISTINCT tv.video_id) as total_videos,
    SUM(tv.view_count) as total_views,
    AVG(tv.engagement_rate) as avg_engagement,
    SUM(tv.like_count) as total_likes
FROM transformed_videos tv
JOIN dim_date dd ON DATE(tv.published_at) = dd.full_date
WHERE tv.published_at >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY dd.full_date, dd.day_name
ORDER BY dd.full_date DESC;

-- ================================
-- FUNCTIONS utilitaires
-- ================================

-- Fonction pour mettre à jour updated_at automatiquement
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Appliquer le trigger sur les tables nécessaires
CREATE TRIGGER update_raw_videos_updated_at
    BEFORE UPDATE ON raw_videos
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_raw_channels_updated_at
    BEFORE UPDATE ON raw_channels
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_transformed_videos_updated_at
    BEFORE UPDATE ON transformed_videos
    FOR EACH ROW
    EXECUTE FUNCTION update_updated_at_column();

-- ================================
-- GRANTS (permissions)
-- ================================

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO youtube_user;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO youtube_user;

-- ================================
-- INITIAL DATA
-- ================================

-- Insérer les catégories YouTube
INSERT INTO dim_category (category_id, category_name) VALUES
(1, 'Film & Animation'),
(2, 'Autos & Vehicles'),
(10, 'Music'),
(15, 'Pets & Animals'),
(17, 'Sports'),
(19, 'Travel & Events'),
(20, 'Gaming'),
(22, 'People & Blogs'),
(23, 'Comedy'),
(24, 'Entertainment'),
(25, 'News & Politics'),
(26, 'Howto & Style'),
(27, 'Education'),
(28, 'Science & Technology'),
(29, 'Nonprofits & Activism')
ON CONFLICT (category_id) DO NOTHING;

-- ================================
-- COMPLETION
-- ================================

SELECT 'YouTube Analytics Database initialized successfully!' AS message;
