import React from 'react';
import { AlertTriangle, Info, AlertCircle } from 'lucide-react';

interface AlertItemProps {
  severity: 'info' | 'warning' | 'critical';
  title: string;
  description: string;
  timestamp: string;
}

export function AlertItem({ severity, title, description, timestamp }: AlertItemProps) {
  const severityConfig = {
    info: {
      icon: Info,
      bgColor: 'bg-blue-50',
      borderColor: 'border-blue-200',
      iconColor: 'text-blue-600',
      iconBg: 'bg-blue-100',
    },
    warning: {
      icon: AlertTriangle,
      bgColor: 'bg-amber-50',
      borderColor: 'border-amber-200',
      iconColor: 'text-amber-600',
      iconBg: 'bg-amber-100',
    },
    critical: {
      icon: AlertCircle,
      bgColor: 'bg-red-50',
      borderColor: 'border-red-200',
      iconColor: 'text-red-600',
      iconBg: 'bg-red-100',
    },
  };

  const config = severityConfig[severity];
  const Icon = config.icon;

  return (
    <div className={`rounded-xl border ${config.borderColor} ${config.bgColor} p-4`}>
      <div className="flex gap-3">
        <div className={`flex-shrink-0 w-10 h-10 rounded-full ${config.iconBg} flex items-center justify-center`}>
          <Icon className={`w-5 h-5 ${config.iconColor}`} />
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-start justify-between gap-2 mb-1">
            <h4 className="text-slate-900">{title}</h4>
            <span className="text-xs text-slate-500 whitespace-nowrap">{timestamp}</span>
          </div>
          <p className="text-sm text-slate-600">{description}</p>
        </div>
      </div>
    </div>
  );
}
