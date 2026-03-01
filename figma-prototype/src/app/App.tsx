import React, { useState } from 'react';
import { LayoutDashboard, Activity, Target, Bell, FileText, Settings, Brain } from 'lucide-react';
import { DashboardScreen } from '@/app/components/screens/DashboardScreen';
import { AnalyticsScreen } from '@/app/components/screens/AnalyticsScreen';
import { OptimizationScreen } from '@/app/components/screens/OptimizationScreen';
import { AlertsScreen } from '@/app/components/screens/AlertsScreen';
import { ReportsScreen } from '@/app/components/screens/ReportsScreen';
import { SettingsScreen } from '@/app/components/screens/SettingsScreen';
import { WelcomeModal } from '@/app/components/WelcomeModal';

type Screen = 'overview' | 'monitoring' | 'optimization' | 'alerts' | 'reports' | 'settings';

interface NavItem {
  id: Screen;
  label: string;
  icon: React.ComponentType<{ className?: string }>;
}

const navItems: NavItem[] = [
  { id: 'overview', label: 'Overview', icon: LayoutDashboard },
  { id: 'monitoring', label: 'Monitor', icon: Activity },
  { id: 'optimization', label: 'Optimize', icon: Target },
  { id: 'alerts', label: 'Alerts', icon: Bell },
  { id: 'reports', label: 'Reports', icon: FileText },
];

export default function App() {
  const [activeScreen, setActiveScreen] = useState<Screen>('overview');
  const [showWelcome, setShowWelcome] = useState(true);

  const renderScreen = () => {
    switch (activeScreen) {
      case 'overview':
        return <DashboardScreen />;
      case 'monitoring':
        return <AnalyticsScreen />;
      case 'optimization':
        return <OptimizationScreen />;
      case 'alerts':
        return <AlertsScreen />;
      case 'reports':
        return <ReportsScreen />;
      case 'settings':
        return <SettingsScreen />;
      default:
        return <DashboardScreen />;
    }
  };

  return (
    <div className="min-h-screen bg-slate-50">
      {/* Welcome Modal */}
      {showWelcome && <WelcomeModal onClose={() => setShowWelcome(false)} />}

      {/* Mobile Container */}
      <div className="max-w-[428px] mx-auto bg-white min-h-screen relative shadow-2xl">
        {/* Main Content */}
        <div className="pb-20 overflow-y-auto" style={{ height: '100vh' }}>
          {renderScreen()}
        </div>

        {/* Bottom Navigation */}
        <div className="fixed bottom-0 left-0 right-0 max-w-[428px] mx-auto bg-white border-t border-slate-200 px-2 py-2 shadow-lg">
          <div className="flex items-center justify-around">
            {navItems.map((item) => {
              const Icon = item.icon;
              const isActive = activeScreen === item.id;
              const hasAlert = item.id === 'alerts';
              return (
                <button
                  key={item.id}
                  onClick={() => setActiveScreen(item.id)}
                  className={`flex flex-col items-center gap-1 px-2 py-2 rounded-xl transition-all relative ${
                    isActive 
                      ? 'text-blue-600 bg-blue-50' 
                      : 'text-slate-500 hover:text-slate-700'
                  }`}
                >
                  <Icon className="w-5 h-5" />
                  <span className="text-[10px]">{item.label}</span>
                  {hasAlert && !isActive && (
                    <div className="absolute top-1 right-2 w-2 h-2 bg-red-500 rounded-full"></div>
                  )}
                </button>
              );
            })}
          </div>
        </div>

        {/* Floating Settings Button */}
        <div className="fixed bottom-24 right-6 max-w-[428px]">
          <button
            onClick={() => setActiveScreen('settings')}
            className={`w-12 h-12 rounded-full ${
              activeScreen === 'settings' 
                ? 'bg-blue-600' 
                : 'bg-slate-700 hover:bg-slate-600'
            } text-white shadow-lg flex items-center justify-center transition-all hover:scale-110`}
          >
            <Settings className="w-5 h-5" />
          </button>
        </div>
      </div>
    </div>
  );
}