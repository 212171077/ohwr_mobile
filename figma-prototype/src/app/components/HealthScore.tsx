import React from 'react';

interface HealthScoreProps {
  score: number;
  size?: 'sm' | 'md' | 'lg';
  label?: string;
}

export function HealthScore({ score, size = 'md', label }: HealthScoreProps) {
  const sizeConfig = {
    sm: { diameter: 80, strokeWidth: 8, fontSize: 'text-xl' },
    md: { diameter: 120, strokeWidth: 10, fontSize: 'text-3xl' },
    lg: { diameter: 160, strokeWidth: 12, fontSize: 'text-4xl' },
  };

  const config = sizeConfig[size];
  const radius = (config.diameter - config.strokeWidth) / 2;
  const circumference = 2 * Math.PI * radius;
  const offset = circumference - (score / 100) * circumference;

  const getColor = (score: number) => {
    if (score >= 90) return '#10B981'; // emerald-500
    if (score >= 70) return '#F59E0B'; // amber-500
    return '#EF4444'; // red-500
  };

  return (
    <div className="flex flex-col items-center gap-2">
      <div className="relative" style={{ width: config.diameter, height: config.diameter }}>
        <svg width={config.diameter} height={config.diameter} className="transform -rotate-90">
          {/* Background circle */}
          <circle
            cx={config.diameter / 2}
            cy={config.diameter / 2}
            r={radius}
            stroke="#E2E8F0"
            strokeWidth={config.strokeWidth}
            fill="none"
          />
          {/* Progress circle */}
          <circle
            cx={config.diameter / 2}
            cy={config.diameter / 2}
            r={radius}
            stroke={getColor(score)}
            strokeWidth={config.strokeWidth}
            fill="none"
            strokeDasharray={circumference}
            strokeDashoffset={offset}
            strokeLinecap="round"
            className="transition-all duration-1000 ease-out"
          />
        </svg>
        <div className="absolute inset-0 flex flex-col items-center justify-center">
          <span className={`${config.fontSize} text-slate-900`}>{score}</span>
          <span className="text-sm text-slate-500">/ 100</span>
        </div>
      </div>
      {label && <span className="text-sm text-slate-600">{label}</span>}
    </div>
  );
}
